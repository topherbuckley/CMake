#
# This module finds if TCL is installed and determines where the
# include files and libraries are. It also determines what the name of
# the library is. This code sets the following variables:
#
#  TCL_LIBRARY      = the full path to the tcl library found (tcl tcl80 etc)
#  TCL_INCLUDE_PATH = the path to where tcl.h can be found
#  TCL_TCLSH        = the full path to the tclsh binary (tcl tcl80 etc)
#  TK_LIBRARY       = the full path to the tk library found (tk tk80 etc)
#  TK_INCLUDE_PATH  = the path to where tk.h can be found
#  TK_INTERNAL_PATH = the path to where tkWinInt.h can be found
#  TK_WISH          = the full path to the wish binary (wish wish80 etc)
#

INCLUDE(${CMAKE_ROOT}/Modules/FindTclsh.cmake)
INCLUDE(${CMAKE_ROOT}/Modules/FindWish.cmake)

GET_FILENAME_COMPONENT(TCL_TCLSH_PATH ${TCL_TCLSH} PATH)

GET_FILENAME_COMPONENT(TK_WISH_PATH ${TK_WISH} PATH)

FIND_LIBRARY(TCL_LIBRARY
  NAMES tcl tcl84 tcl8.4 tcl83 tcl8.3 tcl82 tcl8.2 tcl80 tcl8.0
  PATHS  
  /usr/lib 
  /usr/local/lib
  "C:/Program Files/Tcl/lib" 
  [HKEY_LOCAL_MACHINE\\SOFTWARE\\Scriptics\\Tcl\\8.4;Root]/lib
  [HKEY_LOCAL_MACHINE\\SOFTWARE\\Scriptics\\Tcl\\8.3;Root]/lib
  [HKEY_LOCAL_MACHINE\\SOFTWARE\\Scriptics\\Tcl\\8.2;Root]/lib
  [HKEY_LOCAL_MACHINE\\SOFTWARE\\Scriptics\\Tcl\\8.0;Root]/lib
  "${TCL_TCLSH_PATH}/../lib"
  "${TK_WISH_PATH}/../lib"
)

FIND_LIBRARY(TK_LIBRARY 
  NAMES tk tk84 tk8.4 tk83 tk8.3 tk82 tk8.2 tk80 tk8.0
  PATHS 
  /usr/lib 
  /usr/local/lib
  "C:/Program Files/Tcl/lib" 
  [HKEY_LOCAL_MACHINE\\SOFTWARE\\Scriptics\\Tcl\\8.4;Root]/lib
  [HKEY_LOCAL_MACHINE\\SOFTWARE\\Scriptics\\Tcl\\8.3;Root]/lib
  [HKEY_LOCAL_MACHINE\\SOFTWARE\\Scriptics\\Tcl\\8.2;Root]/lib
  [HKEY_LOCAL_MACHINE\\SOFTWARE\\Scriptics\\Tcl\\8.0;Root]/lib
  "${TCL_TCLSH_PATH}/../lib"
  "${TK_WISH_PATH}/../lib"
)

FIND_PATH(TCL_INCLUDE_PATH tcl.h 
  /usr/include 
  /usr/local/include
  "C:/Program Files/Tcl/include" 
  [HKEY_LOCAL_MACHINE\\SOFTWARE\\Scriptics\\Tcl\\8.4;Root]/include
  [HKEY_LOCAL_MACHINE\\SOFTWARE\\Scriptics\\Tcl\\8.3;Root]/include
  [HKEY_LOCAL_MACHINE\\SOFTWARE\\Scriptics\\Tcl\\8.2;Root]/include
  [HKEY_LOCAL_MACHINE\\SOFTWARE\\Scriptics\\Tcl\\8.0;Root]/include
  "${TCL_TCLSH_PATH}/../include"
  "${TK_WISH_PATH}/../include"
)

FIND_PATH(TK_INCLUDE_PATH tk.h 
  /usr/include 
  /usr/local/include
  "C:/Program Files/Tcl/include" 
  [HKEY_LOCAL_MACHINE\\SOFTWARE\\Scriptics\\Tcl\\8.4;Root]/include
  [HKEY_LOCAL_MACHINE\\SOFTWARE\\Scriptics\\Tcl\\8.3;Root]/include
  [HKEY_LOCAL_MACHINE\\SOFTWARE\\Scriptics\\Tcl\\8.2;Root]/include
  [HKEY_LOCAL_MACHINE\\SOFTWARE\\Scriptics\\Tcl\\8.0;Root]/include
  "${TCL_TCLSH_PATH}/../include"
  "${TK_WISH_PATH}/../include"
)

IF (WIN32)
  FIND_PATH(TK_INTERNAL_PATH tkWinInt.h
    /usr/include 
    /usr/local/include
    "C:/Program Files/Tcl/include" 
    [HKEY_LOCAL_MACHINE\\SOFTWARE\\Scriptics\\Tcl\\8.4;Root]/include
    [HKEY_LOCAL_MACHINE\\SOFTWARE\\Scriptics\\Tcl\\8.3;Root]/include
    [HKEY_LOCAL_MACHINE\\SOFTWARE\\Scriptics\\Tcl\\8.2;Root]/include
    [HKEY_LOCAL_MACHINE\\SOFTWARE\\Scriptics\\Tcl\\8.0;Root]/include
    "${TCL_TCLSH_PATH}/../include"
    "${TK_WISH_PATH}/../include"
  )
  MARK_AS_ADVANCED(TK_INTERNAL_PATH)

  MARK_AS_ADVANCED(
    TCL_TCLSH
    TCL_TCLSH_PATH
    TK_WISH
    TK_WISH_PATH
    TCL_INCLUDE_PATH
    TK_INCLUDE_PATH
    TCL_LIBRARY
    TK_LIBRARY  
    )
ENDIF(WIN32)

