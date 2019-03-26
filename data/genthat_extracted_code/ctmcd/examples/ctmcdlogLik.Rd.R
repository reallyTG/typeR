library(ctmcd)


### Name: ctmcdlogLik
### Title: Discrete-Time Data Log-Likelihood Function
### Aliases: ctmcdlogLik

### ** Examples

data(tm_abs)

## Initial guess for generator matrix (absorbing default state)
gm0=matrix(1,8,8)
diag(gm0)=0
diag(gm0)=-rowSums(gm0)
gm0[8,]=0

## Log-likelihood of initial guess
ctmcdlogLik(gm0,tm_abs,1)



