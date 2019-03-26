library(lmomco)


### Name: rmlmomco
### Title: Mean Residual Quantile Function of the Distributions
### Aliases: rmlmomco
### Keywords: quantile function mean residual quantile function
###   lifetime/reliability analysis The lmomco functions

### ** Examples

# It is easiest to think about residual life as starting at the origin, units in days.
A <- vec2par(c(0.0, 2649, 2.11), type="gov") # so set lower bounds = 0.0
qlmomco(0.5, A)  # The median lifetime = 1261 days
rmlmomco(0.5, A) # The average remaining life given survival to the median = 861 days

# 2nd example with discussion points
F <- nonexceeds(f01=TRUE)
plot(F, qlmomco(F, A), type="l", # usual quantile plot as seen throughout lmomco
     xlab="NONEXCEEDANCE PROBABILITY", ylab="LIFETIME, IN DAYS")
lines(F, rmlmomco(F, A), col=2, lwd=3)           # mean residual life
L1 <- lmomgov(A)$lambdas[1]                      # mean lifetime at start/birth
lines(c(0,1), c(L1,L1), lty=2)                   # line "ML" (mean life)
# Notice how ML intersects M(F|F=0) and again later in "time" (about F = 1/4)  showing
# that this Govindarajulu as a peak mean resiudal life that is **greater** than the
# expected lifetime at start. The M(F) then tapers off to zero at infinity time (F=1).
# M(F) is non-monotonic for this example---not a proper probability dist.



