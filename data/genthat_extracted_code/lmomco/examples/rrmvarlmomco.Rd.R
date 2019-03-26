library(lmomco)


### Name: rrmvarlmomco
### Title: Reversed Variance Residual Quantile Function of the
###   Distributions
### Aliases: rrmvarlmomco
### Keywords: quantile function reversed variance residual quantile
###   function lifetime/reliability analysis The lmomco functions

### ** Examples

# It is easiest to think about residual life as starting at the origin, units in days.
A <- vec2par(c(0.0, 264, 1.6), type="gov") # so set lower bounds = 0.0
rrmvarlmomco(0.5, A) # variance at the median reversed mean residual life
## Not run: 
##D A <- vec2par(c(-100, 264, 1.6), type="gov")
##D F <- nonexceeds(f01=TRUE)
##D plot(F, rmvarlmomco(F,A), type="l")
##D lines(F, rrmvarlmomco(F,A), col=2)
## End(Not run)



