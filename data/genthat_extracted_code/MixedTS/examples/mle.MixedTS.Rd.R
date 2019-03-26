library(MixedTS)


### Name: mle.MixedTS
### Title: Maximum Likelihood Estimation for MixedTS distribution
### Aliases: 'Mixed Tempered Stable distribution' 'Normal Variance Mean
###   Mixture' mle.MixedTS mle

### ** Examples

# First Example:
# We define the Mixed Tempered Stable using the function setMixedTS.param


ParamEx1<-setMixedTS.param(mu0=0, mu=0, sigma=0.4, a=1.5,
                           alpha=0.8, lambda_p=4, lambda_m=1, Mixing="Gamma")

# We generate a sample using the rMixedTS method
set.seed(100)
Rand1 <- rMixedTS(x=5000,object=ParamEx1, setSup=10,setInf=-10,N=2^9)

# Estimate procedure
## Not run: 
##D est1<-mle.MixedTS(object=Rand1 , setSup=10,setInf=-10,N=2^9)
##D # Show results
##D 
##D summary(est1)
## End(Not run)






