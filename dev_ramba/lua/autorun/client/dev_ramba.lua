
surface.CreateFont("Slatu", {
    font = "Slatu2",
    size = ScrW() * 0.012,
    weight = 600,
    antialiasing = true
})

local frame



local function openmenu()
    local w, h = ScrW(), ScrH() 

    frame = vgui.Create("DFrame")
    frame:SetSize(w * 0.25, h * 1)
    frame:SetPos(w * 0.75 , h * 0)
    frame:SetTitle("")
    frame:MakePopup()
    frame:ShowCloseButton(false)
    frame:SetDraggable(false)

    function frame:Paint(_w, _h)
        draw.RoundedBox(150, 0, 0, _w, _h, Color(237, 211, 129))
        draw.SimpleTextOutlined("Ramba Roleplay", "Slatu", _w * 0.5, _h * 0.05, Color(255, 255, 255), TEXT_ALIGN_CENTER, TEXT_ALIGN_TOP, 4, Color(0, 0, 0))

        local imageHeight = 120
        surface.SetDrawColor(255, 255, 255) 
        surface.SetMaterial(Material("materials/devramba/logo.png")) 
        surface.DrawTexturedRect((_w - imageHeight) / 2, _h * 0.1, imageHeight, imageHeight)
    end

    local function DrawButton(text, x, y, w, h, font, textColor, bgColor, borderColor, borderWidth)
        draw.RoundedBox(15, x, y, w, h, borderColor) 
        draw.RoundedBox(15, x + borderWidth, y + borderWidth, w - borderWidth * 2, h - borderWidth * 2, bgColor) 
        local textX = x + w / 2
        local textY = y + h / 2
        draw.SimpleText(text, font, textX + 1, textY + 1, Color(0, 0, 0), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER) 
        draw.SimpleText(text, font, textX, textY, textColor, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
    end
    
    local function CreateButton(text, x, y, w, h, callback)
        local button = vgui.Create("DButton", frame)
        button:SetText("")
        button:SetPos(x, y)
        button:SetSize(w, h)
        button.Paint = function(self, _w, _h)
            local bgColor = Color(255, 255, 255, 255) 
            local borderColor = Color(0, 0, 0, 255) 
            local borderWidth = 2 
            DrawButton(text, 0, 0, _w, _h, "Slatu", Color(0, 0, 0), bgColor, borderColor, borderWidth)
        end
        button.DoClick = callback
        return button
    end
    
    -- CONFIG EN JEU

    local buttonWidth = ScrW() * 0.2 
    local buttonHeight = ScrH() * 0.05 
    local buttonMargin = 5 
    CreateButton("Contacter un Admin", ScrW() * 0.02, ScrH() * 0.2 + 20, buttonWidth, buttonHeight, function()
        RunConsoleCommand("say", "")
    end):SetSize(buttonWidth, buttonHeight)
    
    CreateButton("Changer de Vue", ScrW() * 0.02, ScrH() * 0.2 + buttonHeight + buttonMargin + 30, buttonWidth, buttonHeight, function()
        RunConsoleCommand("say", "")
    end):SetSize(buttonWidth, buttonHeight)
    
    CreateButton("Jeter Son Arme", ScrW() * 0.02, ScrH() * 0.2 + (buttonHeight + buttonMargin) * 2 + 40, buttonWidth, buttonHeight, function()
        RunConsoleCommand("say", "")
    end):SetSize(buttonWidth, buttonHeight)
    
    CreateButton("StopSound", ScrW() * 0.02, ScrH() * 0.2 + (buttonHeight + buttonMargin) * 3 + 50, buttonWidth, buttonHeight, function()
        RunConsoleCommand("say", "")
    end):SetSize(buttonWidth, buttonHeight)
    
    CreateButton("Voir ces Warn(S)", ScrW() * 0.02, ScrH() * 0.2 + (buttonHeight + buttonMargin) * 4 + 60, buttonWidth, buttonHeight, function()
        RunConsoleCommand("say", "")
    end):SetSize(buttonWidth, buttonHeight)
    
    CreateButton("Theme Cartoon", ScrW() * 0.02, ScrH() * 0.2 + (buttonHeight + buttonMargin) * 5 + 70, buttonWidth, buttonHeight, function()
        RunConsoleCommand("say", "!cartoon")
    end):SetSize(buttonWidth, buttonHeight)
    
    local tlcds = CreateButton("Telecharger la collection du Server", ScrW() * 0.02, ScrH() * 0.2 + (buttonHeight + buttonMargin) * 6 + 80, buttonWidth, buttonHeight, function()
        gui.OpenURL("")
    end):SetSize(buttonWidth, buttonHeight)
    
    CreateButton("Voir la Boutique", ScrW() * 0.02, ScrH() * 0.2 + (buttonHeight + buttonMargin) * 7 + 90, buttonWidth, buttonHeight, function()
        gui.OpenURL("https://www.youtube.com/watch?v=xvFZjo5PgG0")
    end):SetSize(buttonWidth, buttonHeight)
end           
hook.Add("OnContextMenuOpen", "SlatuContextOpen", function()
    openmenu()
    return false
end)

hook.Add("OnContextMenuClose", "SlatuContextClose", function()
    if IsValid(frame) then frame:Remove() end
    return false
end)

