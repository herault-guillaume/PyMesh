# Include directories to search for source.
INCLUDE_DIRECTORIES(${PROJECT_SOURCE_DIR}/src)

# Set build type.
#SET(CMAKE_BUILD_TYPE Debug)
SET(CMAKE_BUILD_TYPE Release)

# Create 64 bits binary.  32 bits support is dropped.
SET(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Os -std=c++11")
#SET(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -O0 -std=c++11")
SET(CMAKE_LIBRARY_PATH /opt/local/lib ${CMAKE_LIBRARY_PATH})

# Set output directories
SET(LIBRARY_OUTPUT_PATH    ${PROJECT_SOURCE_DIR}/lib)
SET(EXECUTABLE_OUTPUT_PATH ${PROJECT_SOURCE_DIR}/bin)
SET(CMAKE_SWIG_OUTDIR      ${PROJECT_SOURCE_DIR}/swig)
MAKE_DIRECTORY(${LIBRARY_OUTPUT_PATH})
MAKE_DIRECTORY(${EXECUTABLE_OUTPUT_PATH})
MAKE_DIRECTORY(${CMAKE_SWIG_OUTDIR})

LINK_DIRECTORIES(${LIBRARY_OUTPUT_PATH})
LINK_DIRECTORIES(/opt/local/lib)

# Include customized FindPackage scripts
SET(CMAKE_MODULE_PATH ${PROJECT_SOURCE_DIR}/cmake)

# Set eigen wrapper path
SET(EIGEN_WRAPPER_PATH ${PROJECT_SOURCE_DIR}/eigen_wrapper)

# Disallow depreciated numpy calls
#ADD_DEFINITIONS(-DNPY_NO_DEPRECATED_API=NPY_1_7_API_VERSION)

OPTION(WITHOUT_SWIG "Compile with building swig modules" OFF)
IF(WITHOUT_SWIG)
    MESSAGE("Python modules won't be built!!!")
ENDIF(WITHOUT_SWIG)

SET(CMAKE_MACOSX_RPATH ON)

# Include all libraries
FIND_PACKAGE(AllDependencies)

