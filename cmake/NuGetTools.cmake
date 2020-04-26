cmake_minimum_required(VERSION 3.8.2 FATAL_ERROR)

## User-settable cache variables
set(NUGET_COMMAND "" CACHE STRING
    "NuGet executable used for package installs. Empty means NuGetTools is disabled."
)
set(NUGET_PACKAGES_DIR "${CMAKE_SOURCE_DIR}/packages" CACHE PATH
    "Path to the directory used by NuGet to store installed packages."
)
option(NUGET_NO_CACHE
    "Add -NoCache option to NuGet install commands: \"Disable using the machine cache as the first package source.\""
    FALSE
)
option(NUGET_DIRECT_DOWNLOAD
    "Add -DirectDownload option to NuGet install commands: \"Download directly without populating any caches with metadata or binaries.\""
    FALSE
)
set(NUGET_PACKAGE_SAVE_MODE "" CACHE STRING
    "Add -PackageSaveMode option with passed value if non-empty to NuGet install commands: \"Specifies types of files to save after package installation: nuspec, nupkg, nuspec;nupkg.\""
)

## Includes
include("${CMAKE_CURRENT_LIST_DIR}/internal/NuGetTools.helper.cmake")
include("${CMAKE_CURRENT_LIST_DIR}/internal/NuGetImport.cmake")
include("${CMAKE_CURRENT_LIST_DIR}/internal/NuGetPack.cmake")
include("${CMAKE_CURRENT_LIST_DIR}/internal/NuGetGit.cmake")
include("${CMAKE_CURRENT_LIST_DIR}/internal/NuGetSemVer.cmake")
