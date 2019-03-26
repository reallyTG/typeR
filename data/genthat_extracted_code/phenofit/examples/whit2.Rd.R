library(phenofit)


### Name: whit2
### Title: Weighted Whittaker smoothing with a second order finite
###   difference penalty
### Aliases: whit2

### ** Examples

library(phenofit)
data("MOD13A1")
dt <- tidy_MOD13.gee(MOD13A1$dt)
y <- dt[site == "AT-Neu", ][1:120, y]

plot(y, type = "b")
lines(whit2(y, lambda = 2), col = 2)
lines(whit2(y, lambda = 10), col = 3)
lines(whit2(y, lambda = 100), col = 4)
legend("bottomleft", paste("lambda = ", c(2, 10, 15)), col = 2:4, lty = rep(1, 3))



