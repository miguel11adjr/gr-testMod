INCLUDE(FindPkgConfig)
PKG_CHECK_MODULES(PC_TESTMOD testMod)

FIND_PATH(
    TESTMOD_INCLUDE_DIRS
    NAMES testMod/api.h
    HINTS $ENV{TESTMOD_DIR}/include
        ${PC_TESTMOD_INCLUDEDIR}
    PATHS ${CMAKE_INSTALL_PREFIX}/include
          /usr/local/include
          /usr/include
)

FIND_LIBRARY(
    TESTMOD_LIBRARIES
    NAMES gnuradio-testMod
    HINTS $ENV{TESTMOD_DIR}/lib
        ${PC_TESTMOD_LIBDIR}
    PATHS ${CMAKE_INSTALL_PREFIX}/lib
          ${CMAKE_INSTALL_PREFIX}/lib64
          /usr/local/lib
          /usr/local/lib64
          /usr/lib
          /usr/lib64
)

INCLUDE(FindPackageHandleStandardArgs)
FIND_PACKAGE_HANDLE_STANDARD_ARGS(TESTMOD DEFAULT_MSG TESTMOD_LIBRARIES TESTMOD_INCLUDE_DIRS)
MARK_AS_ADVANCED(TESTMOD_LIBRARIES TESTMOD_INCLUDE_DIRS)

