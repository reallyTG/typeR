library(PBSmodelling)


### Name: unpackList
### Title: Unpack List Elements into Variables
### Aliases: unpackList
### Keywords: file list

### ** Examples

local(envir=.PBSmodEnv,expr={
  x <- list(a=21,b=23);
  unpackList(x);
  print(a);
})



