library(distrMod)


### Name: MCEstimate-class
### Title: MCEstimate-class.
### Aliases: MCEstimate-class criterion criterion,MCEstimate-method
###   criterion.fct criterion.fct,MCEstimate-method
###   startPar,MCEstimate-method method method,MCEstimate-method optimwarn
###   optimwarn,MCEstimate-method criterion<- criterion<-,MCEstimate-method
###   coerce,MCEstimate,mle-method show,MCEstimate-method
###   profile,MCEstimate-method
### Keywords: classes

### ** Examples

## (empirical) Data
x <- rgamma(50, scale = 0.5, shape = 3)

## parametric family of probability measures
G <- GammaFamily(scale = 1, shape = 2)

MDEstimator(x, G)
(m <- MLEstimator(x, G))
m.mle <- as(m,"mle")
par(mfrow=c(1,2))
profileM <- profile(m)
## plot-profile throws an error



