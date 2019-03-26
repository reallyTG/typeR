library(ctmcd)


### Name: gmEM
### Title: Expectation-Maximization Algorithm
### Aliases: gmEM

### ** Examples

data(tm_abs)

## Initial guess for generator matrix (absorbing default state)
gm0=matrix(1,8,8)
diag(gm0)=0
diag(gm0)=-rowSums(gm0)
gm0[8,]=0

## Derive expectation-maximization algorithm generator matrix estimate
gmem=gmEM(tmabs=tm_abs,1,gmguess=gm0,verbose=TRUE)
gmem



