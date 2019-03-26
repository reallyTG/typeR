library(ELYP)


### Name: simuDataYP
### Title: Generate random times that follow the YP model with the Given
###   Parameters th1, th2, and alphaX.
### Aliases: simuDataYP
### Keywords: nonparametric survival

### ** Examples

## generate data and covariates.
X <- -99:100/50        ## the covariate for alpha, 200 long
temp <- simuDataYP(n1=100, n2=100, th1=exp(1), th2=exp(-1), cens=TRUE, alphaX = -0.5*X)
## this generate a sample of censored data with n=200. beta1=1, beta2=-1, alpha= -0.5.
## and the design matrix or covariance matrix is 
Zmat <- cbind(X, temp$Zmat)



