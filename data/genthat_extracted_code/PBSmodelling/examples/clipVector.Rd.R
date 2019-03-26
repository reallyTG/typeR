library(PBSmodelling)


### Name: clipVector
### Title: Clip a Vector at One or Both Ends
### Aliases: clipVector
### Keywords: data utilities

### ** Examples

local(envir=.PBSmodEnv,expr={
  x=c(0,0,0,0,1,1,1,1,0,0)
  print(clipVector(x,0))

  x=c(TRUE,TRUE,FALSE,TRUE)
  print(clipVector(x,TRUE))

  x=c("red","tide","red","red")
  print(clipVector(x,"red",2))
})



