library(StableEstim)


### Name: CgmmParametersEstim
### Title: The generalised method of moment with a continuum of moment
###   conditions
### Aliases: CgmmParametersEstim
### Keywords: Estim-functions

### ** Examples
 
## general inputs
theta <- c(1.45,0.55,1,0)
pm <- 0
set.seed(2345);x <- rstable(50,theta[1],theta[2],theta[3],theta[4],pm)

## GMM specific params
alphaReg=0.01
subdivisions=20
randomIntegrationLaw="unif"
IntegrationMethod="Uniform"

## Estimation
twoS <- CgmmParametersEstim(x=x,type="2S",alphaReg=alphaReg,
                          subdivisions=subdivisions,
                          IntegrationMethod=IntegrationMethod,
                          randomIntegrationLaw=randomIntegrationLaw,
                          s_min=0,s_max=1,theta0=NULL,
                          pm=pm,PrintTime=TRUE)



