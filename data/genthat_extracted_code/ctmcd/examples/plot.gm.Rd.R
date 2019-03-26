library(ctmcd)


### Name: plot.gm
### Title: Plot Function for Generator Matrix Estimation Objects
### Aliases: plot.gm

### ** Examples

data(tm_abs)

## Maximum Likelihood Generator Matrix Estimate
gm0=matrix(1,8,8)
diag(gm0)=0
diag(gm0)=-rowSums(gm0)
gm0[8,]=0

gmem=gm(tm_abs,te=1,method="EM",gmguess=gm0)
plot(gmem)



