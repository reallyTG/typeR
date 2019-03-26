library(fMultivar)


### Name: utils-adapt
### Title: Integrator for multivariate distributions
### Aliases: adapt
### Keywords: math

### ** Examples

## No test: 
## Check that dnorm2d is normalized:
  
   # Normal Density:
   density <- function(x) dnorm2d(x=x[1], y = x[2])
      
   # Calling Cubature:
   BIG <- c(99, 99)
   cubature::adaptIntegrate(f=density, lowerLimit=-BIG, upperLimit=BIG)
   cubature::adaptIntegrate(f=density, low=-BIG, upp=BIG, tol=1e-7)
    
   # Using the Wrapper:
   adapt(lower=-BIG, upper=BIG, functn=density) 
   adapt(lower=-BIG, upper=BIG, functn=density, tol=1e-7)$integral
## End(No test)



