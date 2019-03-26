library(ctmcd)


### Name: rNijTRiT_ModRej
### Title: C++ Based Modified Rejection Sampling
### Aliases: rNijTRiT_ModRej

### ** Examples

data(tm_abs)

## Initial guess for generator matrix (absorbing default state)

gm=matrix(1,8,8)
diag(gm)=0
diag(gm)=-rowSums(gm)
gm[8,]=0

rNijTRiT_ModRej(tm_abs,1,gm)



