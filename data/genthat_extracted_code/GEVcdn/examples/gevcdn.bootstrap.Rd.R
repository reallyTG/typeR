library(GEVcdn)


### Name: gevcdn.bootstrap
### Title: Bootstrapped confidence intervals for GEV CDN parameters and
###   quantiles
### Aliases: gevcdn.bootstrap

### ** Examples

## Generate synthetic data

x <- as.matrix(seq(0.1, 1, length = 50))

loc <- x^2
scl <- x/2
shp <- seq(-0.1, 0.3, length = length(x))

set.seed(100)
y <- as.matrix(rgev(length(x), location = loc, scale = scl,
               shape = shp))

## Not run: 
##D ## Fit 30 bootstrapped models
##D 
##D CI <- gevcdn.bootstrap(n.bootstrap = 30, x = x, y = y,
##D                        iter.max = 100, n.hidden = 2,
##D                        Th = gevcdn.logistic, n.trials = 1,
##D                        boot.method = "residual",
##D                        probs = c(0.1, 0.5, 0.9))
##D 
##D ## Plot data and percentile confidence intervals for GEV parameters
##D 
##D par(mfrow = c(2, 2))
##D matplot(x, y, type = "b", pch = 19, col = "red", xlab = "x",
##D         ylab = "y", main = "gevcdn.bootstrap")
##D matplot(x, cbind(loc, t(apply(CI$location.bootstrap, 1, quantile,
##D         p = c(0.025, 0.975)))), type = c("l", "b", "b"), pch = 20,
##D         lwd = 3, col = c("black", rep("green", 2)), xlab = "x",
##D         ylab = "location", main = "location CI")
##D matplot(x, cbind(scl, t(apply(CI$scale.bootstrap, 1, quantile,
##D         p = c(0.025, 0.975)))), type = c("l", "b", "b"), pch = 20,
##D         lwd = 3, col = c("black", rep("orange", 2)), xlab = "x",
##D         ylab = "scale", main = "scale CI")
##D matplot(x, cbind(shp, t(apply(CI$shape.bootstrap, 1, quantile,
##D         p = c(0.025, 0.975)))), type = c("l", "b", "b"), pch = 20,
##D         lwd = 3, col = c("black", rep("brown", 2)), xlab = "x",
##D         ylab = "shape", main = "shape CI")
## End(Not run)



