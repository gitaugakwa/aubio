project "Aubio"
	kind "StaticLib"
	language "C"

	targetdir ("bin/" .. outputdir .. "/%{prj.name}")
	objdir ("bin-int/" .. outputdir .. "/%{prj.name}")

	includedirs
	{
		"src"
	}

	files
	{
		"src/aubio.h",
		"src/aubio_priv.h",
		"src/**/*.c"
	}

	defines
	{
		"HAVE_C99_VARARGS_MACROS",
		"HAVE_STDLIB_H",
		"HAVE_STDIO_H",
		"HAVE_STDARG_H",
		"HAVE_MATH_H"
	}

	filter "system:windows"
		systemversion "latest"
		staticruntime "On"

	filter "system:linux"
		pic "On"
		systemversion "latest"
		staticruntime "On"

	filter "configurations:Debug"
		runtime "Debug"
		symbols "on"

	filter "configurations:Release"
		runtime "Release"
		optimize "on"
