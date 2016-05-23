--青き眼の威光
--Honor of the Eyes of Blue
--Scripted by edo9300
function c7029.initial_effect(c)
	--destroy
	local e1=Effect.CreateEffect(c)
	e1:SetCode(EVENT_FREE_CHAIN)
	e1:SetProperty(EFFECT_FLAG_CARD_TARGET)
	e1:SetType(EFFECT_TYPE_ACTIVATE)
	e1:SetCountLimit(1,7029+EFFECT_COUNT_CODE_OATH)
	e1:SetCost(c7029.cost)
	e1:SetTarget(c7029.target)
	e1:SetOperation(c7029.operation)
	c:RegisterEffect(e1)
end
function c7029.costfilter(c)
	return c:IsSetCard(0xdd) and c:IsAbleToGraveAsCost()
end
function c7029.cost(e,tp,eg,ep,ev,re,r,rp,chk)
	if chk==0 then return Duel.IsExistingMatchingCard(c7029.costfilter,tp,LOCATION_DECK+LOCATION_HAND,0,1,nil) end
	local g=Duel.SelectMatchingCard(tp,c7029.costfilter,tp,LOCATION_DECK+LOCATION_HAND,0,1,1,nil)
	Duel.SendtoGrave(g,REASON_COST)
end
function c7029.target(e,tp,eg,ep,ev,re,r,rp,chk,chkc)
	if chk==0 then return Duel.IsExistingTarget(Card.IsFaceup,tp,LOCATION_MZONE,LOCATION_MZONE,1,nil) end
	Duel.Hint(HINT_SELECTMSG,tp,HINTMSG_FACEUP)
	Duel.SelectTarget(tp,Card.IsFaceup,tp,LOCATION_MZONE,LOCATION_MZONE,1,1,nil)
end
function c7029.operation(e,tp,eg,ep,ev,re,r,rp)
	local tc=Duel.GetFirstTarget()
	if tc:IsRelateToEffect(e) then
		local e1=Effect.CreateEffect(e:GetHandler())
		e1:SetType(EFFECT_TYPE_SINGLE)
		e1:SetCode(EFFECT_CANNOT_ATTACK)
		e1:SetReset(RESET_EVENT+0x1fe0000)
		tc:RegisterEffect(e1)
	end
end