library(unmarked)


### Name: detFuns
### Title: Distance-sampling detection functions and associated density
###   functions
### Aliases: detFuns gxhn gxexp gxhaz grhn grexp grhaz dxhn dxexp dxhaz
###   drhn drexp drhaz

### ** Examples

# Detection probabilities at 25m for range of half-normal sigma values.
round(gxhn(25, 10:15), 2)

# Plot negative exponential distributions
plot(function(x) gxexp(x, rate=10), 0, 50, xlab="distance",
    ylab="Detection probability")
plot(function(x) gxexp(x, rate=20), 0, 50, add=TRUE, lty=2)
plot(function(x) gxexp(x, rate=30), 0, 50, add=TRUE, lty=3)

# Plot half-normal probability density functions for line- and point-transects
par(mfrow=c(2, 1))
plot(function(x) dxhn(x, 20), 0, 50, xlab="distance",
    ylab="Probability density", main="Line-transect")
plot(function(x) drhn(x, 20), 0, 50, xlab="distance",
    ylab="Probability density", main="Point-transect")



