library(PBSmodelling)


### Name: pad0
### Title: Pad Values with Leading Zeroes
### Aliases: pad0
### Keywords: print

### ** Examples

local(envir=.PBSmodEnv,expr={
  resetGraph(); x <- pad0(x=123,n=10,f=0:7);
  addLabel(.5,.5,paste(x,collapse="\n"),cex=1.5);
})



