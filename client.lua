--[[

 ██████╗  ███████╗ ███╗   ██╗ ██████╗ ███████╗ 
 ██╔══██╗ ██╔════╝ ████╗  ██║║██╔════╝██╔════╝ 
 ██████╔╝ █████╗   ██╔██╗ ██║║██║     █████╗   
 ██╔══██╗ ██╔══╝   ██║╚██╗██║║██║     ██╔══╝   
 ██████╔╝ ███████╗ ██║ ╚████║╚██████╗ ███████╗
 ╚═════╝  ╚══════╝ ╚═╝  ╚═══╝ ╚═════╝ ╚══════╝

]]

-- FOR THE NEW ES_EXTENDED AND ESX VERSION: (if you are using the new version pls remove the comment (--) in the 12th line )

-- ESX = exports["es_extended"]:getSharedObject()


-- OLDER ES_EXTENDED AND ESX VERSION: (if you are not using this version comment (--) until the 24th line and remove the comment in the 12rd line)
ESX = nil

Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
        Citizen.Wait(0)
    end

    for _, blipInfo in pairs(Config.Blips) do
        local blip = AddBlipForCoord(blipInfo.coords)

        SetBlipSprite(blip, blipInfo.type) 
        SetBlipColour(blip, blipInfo.color) 
        SetBlipScale(blip, blipInfo.scale) 
        SetBlipAsShortRange(blip, true) 
        BeginTextCommandSetBlipName("STRING")
        AddTextComponentSubstringPlayerName(blipInfo.name) 
        EndTextCommandSetBlipName(blip)
    end
end)
