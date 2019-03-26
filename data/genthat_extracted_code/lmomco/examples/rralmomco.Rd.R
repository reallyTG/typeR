library(lmomco)


### Name: rralmomco
### Title: Reversed Alpha-Percentile Residual Quantile Function of the
###   Distributions
### Aliases: rralmomco
### Keywords: quantile function alpha-percentile residual quantile function
###   lifetime/reliability analysis The lmomco functions

### ** Examples

# It is easiest to think about residual life as starting at the origin, units in days.
A <- vec2par(c(145, 2649, 2.11), type="gov") # so set lower bounds = 0.0
rralmomco(0.78, A, alpha=50)
## Not run: 
##D F <- nonexceeds(f01=TRUE); r <- range(rralmomco(F,A, alpha=50), ralmomco(F,A, alpha=50))
##D plot(F, rralmomco(F,A, alpha=50), type="l", xlab="NONEXCEEDANCE PROBABILITY",
##D                   ylim=r, ylab="MEDIAN RESIDUAL OR REVERSED LIFETIME, IN DAYS")
##D lines(F, ralmomco(F, A, alpha=50), col=2) # notice the lack of symmetry
## End(Not run)



