library(PBSmodelling)


### Name: show0
### Title: Convert Numbers into Text with Specified Decimal Places
### Aliases: show0
### Keywords: print

### ** Examples

local(envir=.PBSmodEnv,expr={
  oldpar = par(no.readonly=TRUE)
  frame()

  #do not show decimals on integers
  addLabel(0.25,0.75,show0(15.2,4))
  addLabel(0.25,0.7,show0(15.1,4))
  addLabel(0.25,0.65,show0(15,4))

  #show decimals on integers
  addLabel(0.25,0.55,show0(15.2,4,TRUE))
  addLabel(0.25,0.5,show0(15.1,4,TRUE))
  addLabel(0.25,0.45,show0(15,4,TRUE))
  par(oldpar)
})



