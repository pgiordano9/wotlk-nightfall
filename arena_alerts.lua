local EventFrame = CreateFrame("frame", "EventFrame")
EventFrame:RegisterEvent("UNIT_AURA")

local f = CreateFrame("Frame",nil,UIParent)
f:SetFrameStrata("BACKGROUND")
f:SetWidth(32)
f:SetHeight(32) 

local t = f:CreateTexture(nil,"BACKGROUND")
t:SetColorTexture(0.5, 0, 1, 1)
t:SetAllPoints(f)
f.texture = t

f:SetPoint("CENTER",0,-120)
f:Hide()

EventFrame:SetScript("OnEvent", function(self, event, ...)
	local target = ...;

	if target == "player" then
		nightmare = false

		for i=1,40 do
			current_buff_name = UnitAura("player", i)
	
			if current_buff_name == "Shadow Trance" then
				nightmare = true
			end
				
		end

		if nightmare then
			f:Show()
		else
			f:Hide()
		end
	end

end)
