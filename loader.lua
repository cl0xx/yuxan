--[[
    YUXAN.CC PREMIUM LOADER (FIXED V3 - UNDETECTED)
--]]

local HttpService = game:GetService("HttpService")
local TweenService = game:GetService("TweenService")
local CoreGui = game:GetService("CoreGui")
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

-- Stealth Name Generation
local function GenerateName()
    return HttpService:GenerateGUID(false):gsub("-", ""):sub(1, math.random(8, 12))
end

local StealthName = GenerateName()

-- UI Temizliği (Global Variable Check - Stealthier than FindFirstChild)
if getgenv().YuxanLoaded then
    pcall(function() getgenv().YuxanLoaded:Destroy() end)
    getgenv().YuxanLoaded = nil
end

-- Stealth Parenting
local Parent = nil
if gethui then
    Parent = gethui()
elseif (syn and syn.protect_gui) then
    Parent = CoreGui
else
    Parent = CoreGui
end

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = StealthName
ScreenGui.Parent = Parent
ScreenGui.IgnoreGuiInset = true
ScreenGui.DisplayOrder = 999

if (syn and syn.protect_gui) then
    syn.protect_gui(ScreenGui)
end

getgenv().YuxanLoaded = ScreenGui

-- Karartma Arkaplanı
local Background = Instance.new("Frame")
Background.Size = UDim2.new(1, 0, 1, 0)
Background.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Background.BackgroundTransparency = 1
Background.Parent = ScreenGui

-- Ana Panel
local MainFrame = Instance.new("Frame")
MainFrame.Size = UDim2.new(0, 0, 0, 120)
MainFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
MainFrame.AnchorPoint = Vector2.new(0.5, 0.5)
MainFrame.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
MainFrame.BorderSizePixel = 0
MainFrame.ClipsDescendants = true
MainFrame.ZIndex = 2
MainFrame.Parent = ScreenGui

local Corner = Instance.new("UICorner")
Corner.CornerRadius = UDim.new(0, 10)
Corner.Parent = MainFrame

local Stroke = Instance.new("UIStroke")
Stroke.Color = Color3.fromRGB(255, 255, 255)
Stroke.Transparency = 0.8
Stroke.Thickness = 1.5
Stroke.Parent = MainFrame

-- Logo (Obfuscated Text)
local Title = Instance.new("TextLabel")
Title.Size = UDim2.new(1, 0, 0, 40)
Title.Position = UDim2.new(0, 0, 0, 15)
Title.BackgroundTransparency = 1
Title.Text = string.reverse("cc.naxuy")
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.Font = Enum.Font.GothamBold
Title.TextSize = 24
Title.ZIndex = 3
Title.Parent = MainFrame

-- Durum Yazısı
local Status = Instance.new("TextLabel")
Status.Size = UDim2.new(1, 0, 0, 20)
Status.Position = UDim2.new(0, 0, 0, 50)
Status.BackgroundTransparency = 1
Status.Text = "Initializing..."
Status.TextColor3 = Color3.fromRGB(180, 180, 180)
Status.Font = Enum.Font.Gotham
Status.TextSize = 13
Status.ZIndex = 3
Status.Parent = MainFrame

-- Progress Bar
local ProgressContainer = Instance.new("Frame")
ProgressContainer.Size = UDim2.new(0.8, 0, 0, 6)
ProgressContainer.Position = UDim2.new(0.5, 0, 0, 85)
ProgressContainer.AnchorPoint = Vector2.new(0.5, 0)
ProgressContainer.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
ProgressContainer.ZIndex = 3
ProgressContainer.Parent = MainFrame

local ProgressFill = Instance.new("Frame")
ProgressFill.Size = UDim2.new(0, 0, 1, 0)
ProgressFill.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
ProgressFill.ZIndex = 4
ProgressFill.Parent = ProgressContainer

Instance.new("UICorner", ProgressContainer).CornerRadius = UDim.new(1, 0)
Instance.new("UICorner", ProgressFill).CornerRadius = UDim.new(1, 0)

-- Selection Frame
local SelectionFrame = Instance.new("Frame")
SelectionFrame.Size = UDim2.new(1, -40, 0, 0)
SelectionFrame.Position = UDim2.new(0.5, 0, 0, 60)
SelectionFrame.AnchorPoint = Vector2.new(0.5, 0)
SelectionFrame.BackgroundTransparency = 1
SelectionFrame.ClipsDescendants = true
SelectionFrame.ZIndex = 5
SelectionFrame.Parent = MainFrame

local UIListLayout = Instance.new("UIListLayout")
UIListLayout.Parent = SelectionFrame
UIListLayout.Padding = UDim.new(0, 8)
UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center

local function CreateButton(name, url)
    local Button = Instance.new("TextButton")
    Button.Size = UDim2.new(1, 0, 0, 35)
    Button.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
    Button.BorderSizePixel = 0
    Button.Text = name
    Button.TextColor3 = Color3.fromRGB(200, 200, 200)
    Button.Font = Enum.Font.GothamMedium
    Button.TextSize = 14
    Button.AutoButtonColor = false
    Button.ZIndex = 6
    Button.Parent = SelectionFrame

    local BtnCorner = Instance.new("UICorner")
    BtnCorner.CornerRadius = UDim.new(0, 6)
    BtnCorner.Parent = Button

    local BtnStroke = Instance.new("UIStroke")
    BtnStroke.Color = Color3.fromRGB(255, 255, 255)
    BtnStroke.Transparency = 0.9
    BtnStroke.Thickness = 1
    BtnStroke.Parent = Button

    Button.MouseEnter:Connect(function()
        TweenService:Create(Button, TweenInfo.new(0.3), {BackgroundColor3 = Color3.fromRGB(35, 35, 35), TextColor3 = Color3.fromRGB(255, 255, 255)}):Play()
        TweenService:Create(BtnStroke, TweenInfo.new(0.3), {Transparency = 0.7}):Play()
    end)

    Button.MouseLeave:Connect(function()
        TweenService:Create(Button, TweenInfo.new(0.3), {BackgroundColor3 = Color3.fromRGB(25, 25, 25), TextColor3 = Color3.fromRGB(200, 200, 200)}):Play()
        TweenService:Create(BtnStroke, TweenInfo.new(0.3), {Transparency = 0.9}):Play()
    end)

    Button.MouseButton1Click:Connect(function()
        Status.Text = "Loading..."
        TweenService:Create(SelectionFrame, TweenInfo.new(0.5), {Size = UDim2.new(1, -40, 0, 0)}):Play()
        task.wait(0.5)
        
        local success, err = pcall(function()
            local code = game:HttpGet(url)
            loadstring(code)()
        end)
        
        if success then
            Status.Text = "Completed"
            task.wait(0.5)
            TweenService:Create(MainFrame, TweenInfo.new(0.6, Enum.EasingStyle.Back, Enum.EasingDirection.In), {Size = UDim2.new(0, 0, 0, 120)}):Play()
            TweenService:Create(Background, TweenInfo.new(0.5), {BackgroundTransparency = 1}):Play()
            task.wait(0.6)
            ScreenGui:Destroy()
            getgenv().YuxanLoaded = nil
        else
            Status.Text = "Error"
        end
    end)
end

-- Animasyon Fonksiyonu
local function UpdateProgress(percent, text)
    Status.Text = text
    TweenService:Create(ProgressFill, TweenInfo.new(0.5, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {
        Size = UDim2.new(percent/100, 0, 1, 0)
    }):Play()
end

-- BAŞLAT
TweenService:Create(Background, TweenInfo.new(0.5), {BackgroundTransparency = 0.5}):Play()
task.wait(0.3)
TweenService:Create(MainFrame, TweenInfo.new(0.8, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {Size = UDim2.new(0, 350, 0, 120)}):Play()
task.wait(0.8)

UpdateProgress(20, "Securing...")
task.wait(0.6)
UpdateProgress(50, "Patching...")
task.wait(0.6)
UpdateProgress(80, "Finalizing...")
task.wait(0.6)
UpdateProgress(100, "Done")
task.wait(0.5)

-- Seçim Menüsünü Göster
TweenService:Create(MainFrame, TweenInfo.new(0.6, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {Size = UDim2.new(0, 350, 0, 250)}):Play()
TweenService:Create(ProgressContainer, TweenInfo.new(0.4), {BackgroundTransparency = 1}):Play()
TweenService:Create(ProgressFill, TweenInfo.new(0.4), {BackgroundTransparency = 1}):Play()
TweenService:Create(Status, TweenInfo.new(0.4), {Position = UDim2.new(0, 0, 0, 45)}):Play()
Status.Text = "Select Option"

task.wait(0.2)
SelectionFrame.Size = UDim2.new(1, -40, 0, 160)

CreateButton("Universal", "https://raw.githubusercontent.com/cl0xx/yuxan/refs/heads/main/yuxanuniversalobf.lua")
CreateButton("Blox Strike", "https://raw.githubusercontent.com/cl0xx/yuxan/refs/heads/main/yuxancbobf.lua")


-- Kapatma butonu gerekirse buraya eklenebilir
