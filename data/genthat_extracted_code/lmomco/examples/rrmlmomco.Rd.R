library(lmomco)


### Name: rrmlmomco
### Title: Reversed Mean Residual Quantile Function of the Distributions
### Aliases: rrmlmomco
### Keywords: quantile function reversed mean residual quantile function
###   lifetime/reliability analysis The lmomco functions

### ** Examples

# It is easiest to think about residual life as starting at the origin, units in days.
A <- vec2par(c(0.0, 2649, 2.6), type="gov") # so set lower bounds = 0.0
qlmomco(0.5, A)  # The median lifetime = 1005 days
rrmlmomco(0.5, A) # The reversed mean remaining life given median survival = 691 days

## Not run: 
##D F <- nonexceeds(f01=TRUE)
##D plot(F, qlmomco(F,A), type="l", # life
##D      xlab="NONEXCEEDANCE PROBABILITY", ylab="LIFETIME, IN DAYS")
##D lines(F,  rmlmomco(F, A), col=4, lwd=4) # thick blue, mean residual life
##D lines(F, rrmlmomco(F, A), col=2, lwd=4) # thick red, reversed mean residual life
## End(Not run)



