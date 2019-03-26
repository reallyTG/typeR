library(PBSmodelling)


### Name: findProgram
### Title: Locates a program in the PATH environment variable
### Aliases: findProgram
### Keywords: file

### ** Examples

local(envir=.PBSmodEnv,expr={
  print(list(
  gcc =     findProgram( "gcc" ),
  notepad = findProgram( "notepad" ),
  R       = findProgram( "R", includename=TRUE ) ))
})



