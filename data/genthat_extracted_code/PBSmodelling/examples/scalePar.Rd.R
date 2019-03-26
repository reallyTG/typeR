library(PBSmodelling)


### Name: scalePar
### Title: Scale Parameters to [0,1]
### Aliases: scalePar
### Keywords: optimize

### ** Examples

local(envir=.PBSmodEnv,expr={
  pvec <- data.frame(val=c(1,100,10000),min=c(0,0,0),max=c(5,500,50000),
    active=c(TRUE,TRUE,TRUE))
  S    <- scalePar(pvec)
  print(cbind(pvec,S))
})



