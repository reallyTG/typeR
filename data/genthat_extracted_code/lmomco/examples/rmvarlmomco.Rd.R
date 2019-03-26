library(lmomco)


### Name: rmvarlmomco
### Title: Variance Residual Quantile Function of the Distributions
### Aliases: rmvarlmomco
### Keywords: quantile function variance residual quantile function
###   lifetime/reliability analysis The lmomco functions

### ** Examples

# It is easiest to think about residual life as starting at the origin, units in days.
A <- vec2par(c(0.0, 2649, 2.11), type="gov") # so set lower bounds = 0.0
qlmomco(0.5, A)  # The median lifetime = 1261 days
rmlmomco(0.5, A) # The average remaining life given survival to the median = 861 days
rmvarlmomco(0.5, A) # and the variance of that value.
## Not run: 
##D A <- lmom2par(vec2lmom(c(2000, 450, 0.14, 0.1)), type="kap")
##D F <- nonexceeds(f01=TRUE)
##D plot(F, qlmomco(F,A), type="l", ylim=c(100,6000),
##D      xlab="NONEXCEEDANCE PROBABILITY", ylab="LIFETIME OR SQRT(VAR LIFE), IN DAYS")
##D lines(F, sqrt( rmvarlmomco(F, A)), col=4, lwd=4) # thick blue, residual mean life
##D lines(F, sqrt(rrmvarlmomco(F, A)), col=2, lwd=4) # thick red, reversed resid. mean life
##D lines(F,   rmlmomco(F,A), col=4, lty=2); lines(F, rrmlmomco(F,A), col=2, lty=2)
##D lines(F,  tttlmomco(F,A), col=3, lty=2); lines(F,  cmlmomco(F,A), col=3)
## End(Not run)



