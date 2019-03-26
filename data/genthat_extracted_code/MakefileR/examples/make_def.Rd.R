library(MakefileR)


### Name: make_def
### Title: Creates a variable definition in a Makefile
### Aliases: make_def

### ** Examples

make_def("R_USER_LIBRARY", .libPaths()[[1L]])
makefile() +
  make_def("R_USER_LIBRARY", .libPaths()[[1L]])




