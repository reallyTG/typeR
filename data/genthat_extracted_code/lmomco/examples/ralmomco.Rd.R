library(lmomco)


### Name: ralmomco
### Title: Alpha-Percentile Residual Quantile Function of the Distributions
### Aliases: ralmomco
### Keywords: quantile function alpha-percentile residual quantile function
###   lifetime/reliability analysis The lmomco functions

### ** Examples

# It is easiest to think about residual life as starting at the origin, units in days.
A <- vec2par(c(0.0, 2649, 2.11), type="gov") # so set lower bounds = 0.0
maximum.lifetime <- quagov(1,A) # 2649 days
ralmomco(0,A,alpha=0)   #    0 days
ralmomco(0,A,alpha=100) # 2649 days
ralmomco(1,A,alpha=0)   #    0 days (death certain)
ralmomco(1,A,alpha=100) #    0 days (death certain)
## Not run: 
##D F <- nonexceeds(f01=TRUE)
##D plot(F, qlmomco(F,A), type="l",
##D      xlab="NONEXCEEDANCE PROBABILITY", ylab="LIFETIME, IN DAYS")
##D lines(F, rmlmomco(F, A), col=4, lwd=4) # thick blue, residual mean life
##D lines(F, ralmomco(F, A, alpha=50), col=2) # solid red, median residual life
##D lines(F, ralmomco(F, A, alpha=10), col=2, lty=2) # lower dashed line,
##D                                               # the 10th percentile of residual life
##D lines(F, ralmomco(F, A, alpha=90), col=2, lty=2) # upper dashed line,
##D                                               # 10th percentile of residual life
## End(Not run)



