library(PBSmodelling)


### Name: restorePar
### Title: Get Actual Parameters from Scaled Values
### Aliases: restorePar
### Keywords: optimize

### ** Examples

local(envir=.PBSmodEnv,expr={
  pvec <- data.frame(val=c(1,100,10000),min=c(0,0,0),max=c(5,500,50000),
    active=c(TRUE,TRUE,TRUE))
  S    <- c(.5,.5,.5)
  P    <- restorePar(S,pvec)
  print(cbind(pvec,S,P))
})



