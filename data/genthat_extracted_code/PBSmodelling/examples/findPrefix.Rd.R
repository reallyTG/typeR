library(PBSmodelling)


### Name: findPrefix
### Title: Find a Prefix Based on Names of Existing Files
### Aliases: findPrefix findSuffix
### Keywords: file

### ** Examples

local(envir=.PBSmodEnv,expr={
  edir = system.file("examples", package="PBSmodelling")
  print(findPrefix(suffix=c(".txt", ".r"),path=edir)); cat("\n")

  #or use R's dir for similar functionality
  print(dir(pattern="txt$",path=edir)); cat("\n")
  print(dir(pattern="^[a-h]",path=edir)); cat("\n")
})



