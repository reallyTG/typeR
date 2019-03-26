library(FDGcopulas)


### Name: FDGcopulas-package
### Title: Deals with FDG copulas
### Aliases: FDGcopulas-package
### Keywords: copula multivariate

### ** Examples

## creates an object of class 'FDGcopula' 
myFDGcopula <- FDGcopula("frechet", c(.3,.5,.7,.9))

## compute the pairwise dependence coefficients 
## Spearman's rho:
rhoFDG(myFDGcopula)
## Kendall's tau:
tauFDG(myFDGcopula)
## Upper tail dependence coefficient:
utdcFDG(myFDGcopula)
## Lower tail dependence coefficient:
ltdcFDG(myFDGcopula)

## simulates data ##
dat <- rFDG(30, myFDGcopula)

## fit data ##
myFittedCopula <- fitFDG(myFDGcopula, dat)



