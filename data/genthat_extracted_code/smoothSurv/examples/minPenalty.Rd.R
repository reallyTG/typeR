library(smoothSurv)


### Name: minPenalty
### Title: Minimize the penalty term under the two (mean and variance)
###   constraints
### Aliases: minPenalty
### Keywords: optimize

### ** Examples

optimum <- minPenalty(knots=seq(-4.2, 4.2, by = 0.3), sdspline=0.2, difforder=3)
where <- optimum$spline
print(where)
show <- eval.Gspline(where, seq(-4.2, 4.2, by=0.05))
plot(show, type="l", bty="n", lwd=2)



