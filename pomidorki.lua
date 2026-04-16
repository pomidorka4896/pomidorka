
local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/Robojini/Tuturial_UI_Library/main/UI_Template_1"))()

local Window = Library.CreateLib("Я УЖЕ КРАСНЫЙ", "RJTheme1")

local Tab = Window:NewTab("Player")

local Section = Tab:NewSection("Character")


Section:NewButton("Speed Boost", "ButtonInfo", function()
      while game:GetService("RunService").RenderStepped:wait()do
    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 350
      end
end)

Section:NewButton("Jump Power", "ButtonInfo", function()
      while game:GetService("RunService").RenderStepped:wait()do
    game.Players.LocalPlayer.Character.Humanoid.JumpPower = 150
      end
end)

Section:NewToggle("Tp tool", "ToggleInfo", function(state)
    if state then
mouse = game.Players.LocalPlayer:GetMouse()
tool = Instance.new("Tool")
tool.RequiresHandle = false
tool.Name = "Tp tool"
tool.Activated:connect(function()
local pos = mouse.Hit+Vector3.new(0,2.5,0)
pos = CFrame.new(pos.X,pos.Y,pos.Z)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = pos
end)
tool.Parent = game.Players.LocalPlayer.Backpack
    else
local player = game.Players.LocalPlayer
local backpack = player.Backpack
local toolName = "Tp tool"

local tool = backpack:FindFirstChild(toolName)
if tool then
    tool:Destroy()
    print("Инструмент '" .. toolName .. "' удалён из рюкзака.")
else
    print("Инструмент '" .. toolName .. "' не найден в рюкзаке.")
end
    end
end)

Section:NewButton("Inf Jump", "ButtonInfo", function()
local InfiniteJumpEnabled = true

game:GetService("UserInputService").JumpRequest:Connect(function()
    if InfiniteJumpEnabled then
        game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Humanoid"):ChangeState("Jumping")
    end
end)
end)
