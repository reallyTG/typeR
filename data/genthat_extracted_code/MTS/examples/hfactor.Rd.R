library(MTS)


### Name: hfactor
### Title: Constrained Factor Model
### Aliases: hfactor

### ** Examples

data("mts-examples",package="MTS")
rtn=log(tenstocks[,2:11]+1) # compute log returns
h1=c(1,1,1,1,rep(0,6)) # specify the constraints
h2=c(0,0,0,0,1,1,1,0,0,0)
h3=c(rep(0,7),1,1,1)
H=cbind(h1,h2,h3)
m1=hfactor(rtn,H,3)



