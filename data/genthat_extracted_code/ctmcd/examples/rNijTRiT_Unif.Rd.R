library(ctmcd)


### Name: rNijTRiT_Unif
### Title: C++ Based Uniformization Sampling
### Aliases: rNijTRiT_Unif

### ** Examples

data(tm_abs)

## Generator Matrix
gm=matrix(1,8,8)
diag(gm)=0
diag(gm)=-rowSums(gm)
gm[8,]=0

## Transition Probability Matrix
library(expm)
te=1
tpm=expm(gm*te)

rNijTRiT_Unif(tm_abs,te,gm,tpm)



