library(ctmcd)


### Name: gm
### Title: Generator Matrix Estimation
### Aliases: gm

### ** Examples

data(tm_abs)

## Maximum Likelihood Generator Matrix Estimate
gm0=matrix(1,8,8)
diag(gm0)=0
diag(gm0)=-rowSums(gm0)
gm0[8,]=0

gmem=gm(tm_abs,te=1,method="EM",gmguess=gm0)
gmem

## Quasi Optimization Estimate
tm_rel=rbind((tm_abs/rowSums(tm_abs))[1:7,],c(rep(0,7),1))

gmqo=gm(tm_rel,te=1,method="QO")
gmqo



