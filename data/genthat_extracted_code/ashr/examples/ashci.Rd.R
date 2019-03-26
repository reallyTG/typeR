library(ashr)


### Name: ashci
### Title: Credible Interval Computation for the ash object
### Aliases: ashci

### ** Examples

beta = c(rep(0,20),rnorm(20))
sebetahat = abs(rnorm(40,0,1))
betahat = rnorm(40,beta,sebetahat)
beta.ash = ash(betahat, sebetahat)

CImatrix=ashci(beta.ash,level=0.95)

CImatrix1=ashci(beta.ash,level=0.95,betaindex=c(1,2,5))
CImatrix2=ashci(beta.ash,level=0.95,lfsr_threshold=0.1)



