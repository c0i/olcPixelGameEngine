-- premake5.lua
--[[

> generate visual studio project
https://premake.github.io/download/

> install 3rd libs
https://vcpkg.io/en/index.html

# install vcpkg
git clone https://github.com/Microsoft/vcpkg.git
.\vcpkg\bootstrap-vcpkg.bat
vcpkg integrate install
vcpkg install sdl

# generate vs project
premake5 vs2022 --file=premake5_vs.lua
]]


workspace "olcPixelGameEngine"
    configurations { "Debug", "Release" }
    platforms { "x64", "x32" }
    location ('build')
    includedirs { ".", "./Extensions" }
    -- linkoptions { "/std:c++17" }
    cppdialect('C++17')

    filter { "platforms:*32" } 
        architecture "x86"
        links {"opengl32"}
    filter { "platforms:*64" } architecture "x64"

    filter "configurations:Debug"
        defines { "DEBUG" }
        symbols "On"

    filter "configurations:Release"
        defines { "NDEBUG" }
        optimize "On"



project "olcExampleProgram"
    kind "ConsoleApp"
    language "C"
    targetdir "bin/%{cfg.buildcfg}"

    files { "olcExampleProgram.cpp" }

-- project "OneLoneCoder_PGE_Mandelbrot"
--     kind "ConsoleApp"
--     language "C"
--     targetdir "bin/%{cfg.buildcfg}"

--     files { "Videos/OneLoneCoder_PGE_Mandelbrot.cpp" }

apps = {
    {'OneLoneCoder_PGE_Mandelbrot', 'Videos/OneLoneCoder_PGE_Mandelbrot.cpp'},
    {'OneLoneCoder_PGE_8BitsImProc', 'Videos/OneLoneCoder_PGE_8BitsImProc.cpp'},
    {'OneLoneCoder_PGE_Balls2', 'Videos/OneLoneCoder_PGE_Balls2.cpp'},
    {'OneLoneCoder_PGE_CircleVsRect', 'Videos/OneLoneCoder_PGE_CircleVsRect.cpp'},
    {'OneLoneCoder_PGE_Dithering', 'Videos/OneLoneCoder_PGE_Dithering.cpp'},    

    {'OneLoneCoder_PGE_DungeonWarping', 'Videos/OneLoneCoder_PGE_DungeonWarping.cpp'},
    {'OneLoneCoder_PGE_ExtensionTestGFX2D', 'Videos/OneLoneCoder_PGE_ExtensionTestGFX2D.cpp'},
    {'OneLoneCoder_PGE_FiveDice', 'Videos/OneLoneCoder_PGE_FiveDice.cpp'},
    {'OneLoneCoder_PGE_CircleVsRect', 'Videos/OneLoneCoder_PGE_CircleVsRect.cpp'},
    {'OneLoneCoder_PGE_IsometricTiles', 'Videos/OneLoneCoder_PGE_IsometricTiles.cpp'},

    {'OneLoneCoder_PGE_Mandelbrot', 'Videos/OneLoneCoder_PGE_Mandelbrot.cpp'},
    {'OneLoneCoder_PGE_MIDI', 'Videos/OneLoneCoder_PGE_MIDI.cpp'},
    {'OneLoneCoder_PGE_olcEngine3D', 'Videos/OneLoneCoder_PGE_olcEngine3D.cpp'},
    {'OneLoneCoder_PGE_PathFinding_WaveProp', 'Videos/OneLoneCoder_PGE_PathFinding_WaveProp.cpp'},
    {'OneLoneCoder_PGE_PolygonCollisions1', 'Videos/OneLoneCoder_PGE_PolygonCollisions1.cpp'},  

    {'OneLoneCoder_PGE_Polymorphism', 'Videos/OneLoneCoder_PGE_Polymorphism.cpp'},
    {'OneLoneCoder_PGE_ProcGen_Universe', 'Videos/OneLoneCoder_PGE_ProcGen_Universe.cpp'},
    {'OneLoneCoder_PGE_QuadTree1', 'Videos/OneLoneCoder_PGE_QuadTree1.cpp'},
    {'OneLoneCoder_PGE_RayCastDDA', 'Videos/OneLoneCoder_PGE_RayCastDDA.cpp'},
    {'OneLoneCoder_PGE_RayCastWorld_Simple', 'Videos/OneLoneCoder_PGE_RayCastWorld_Simple.cpp'},     

    {'OneLoneCoder_PGE_Rectangles', 'Videos/OneLoneCoder_PGE_Rectangles.cpp'},
    {'OneLoneCoder_PGE_RetroMenu', 'Videos/OneLoneCoder_PGE_RetroMenu.cpp'},
    {'OneLoneCoder_PGE_RobotArm1', 'Videos/OneLoneCoder_PGE_RobotArm1.cpp'},
    {'OneLoneCoder_PGE_RobotCar1', 'Videos/OneLoneCoder_PGE_RobotCar1.cpp'},
    {'OneLoneCoder_PGE_ShadowCasting2D', 'Videos/OneLoneCoder_PGE_ShadowCasting2D.cpp'},     

    {'OneLoneCoder_PGE_ShootEmUp', 'Videos/OneLoneCoder_PGE_ShootEmUp.cpp'},
    {'OneLoneCoder_PGE_SlidingBlockPuzzle', 'Videos/OneLoneCoder_PGE_SlidingBlockPuzzle.cpp'},
    {'OneLoneCoder_PGE_SoundTest', 'Videos/OneLoneCoder_PGE_SoundTest.cpp'},
    {'OneLoneCoder_PGE_SpriteTransforms', 'Videos/OneLoneCoder_PGE_SpriteTransforms.cpp'},
    {'OneLoneCoder_VIDEO_IntrinsicFunctions', 'Videos/OneLoneCoder_VIDEO_IntrinsicFunctions.cpp'},

}
for _,v in ipairs(apps) do
    print('v', v)
    name = v[1]
    file_list = v[2]
    print('name', name, file_list)
    project (name)
        kind "ConsoleApp"
        language "C"
        targetdir "bin/%{cfg.buildcfg}"

        if name == 'OneLoneCoder_PGE_Balls2' then
            cppdialect('C++14')
        end
        
        files { file_list }
end

