library(StableEstim)


### Name: IntegrateRandomVectorsProduct
### Title: Integrate Ranndom vectors product
### Aliases: IntegrateRandomVectorsProduct
### Keywords: general-functions

### ** Examples

## Define the integrand
f_fct <- function(s,x){sapply(X=x,
                              FUN=sampleComplexCFMoment,
                              t=s,theta=theta)
                   }
f_bar_fct <- function(s,x){Conj(f_fct(s,x))}

## Function specific arguments
theta <- c(1.5,0.5,1,0)
set.seed(345);X=rstable(3,1.5,0.5,1,0)
s_min=0;s_max=2
numberIntegrationPoints=10
randomIntegrationLaw="norm"

Estim_Simpson<- IntegrateRandomVectorsProduct(f_fct,X,f_bar_fct,X,s_min,s_max,
                                              numberIntegrationPoints,
                                              "Simpson",randomIntegrationLaw)




