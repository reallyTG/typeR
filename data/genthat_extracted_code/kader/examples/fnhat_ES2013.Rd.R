library(kader)


### Name: fnhat_ES2013
### Title: Robust Kernel Density Estimator of Eichner & Stute (2013)
### Aliases: fnhat_ES2013

### ** Examples

require(stats);   require(grDevices);   require(datasets)

 # Simulated N(0,1)-data and one sigma-value
set.seed(2016);     n <- 100;     d <- rnorm(n)
xgrid <- seq(-4, 4, by = 0.1)
(fit <- fnhat_ES2013(x = xgrid, data = d, K = dnorm, h = n^(-1/5),
  ranktrafo = J2, sigma = 1) )
## No test: 
plot(fit, ylim = range(0, dnorm(0), fit$y), col = "blue")
curve(dnorm, add = TRUE);   rug(d, col = "red")
legend("topleft", lty = 1, col = c("blue", "black", "red"),
  legend = expression(hat(f)[n], phi, "data"))
## End(No test)
## No test: 
 # The same data, but several sigma-values
sigmas <- seq(1, 4, length = 4)
(fit <- lapply(sigmas, function(sig)
  fnhat_ES2013(x = xgrid, data = d, K = dnorm, h = n^(-1/5),
    ranktrafo = J2, sigma = sig)) )

ymat <- sapply(fit, "[[", "y")
matplot(x = xgrid, y = ymat, type = "l", lty = 1, col = 2 + seq(sigmas),
  ylim = range(0, dnorm(0), ymat), main = "", xlab = "", ylab = "Density")
curve(dnorm, add = TRUE);   rug(d, col = "red")
legend("topleft", lty = 1, col = c("black", "red", NA), bty = "n",
  legend = expression(phi, "data", hat(f)[n]~"in other colors"))
## End(No test)
## No test: 
 # Old-Faithful-eruptions-data and several sigma-values
d <- faithful$eruptions;     n <- length(d);     er <- extendrange(d)
xgrid <- seq(er[1], er[2], by = 0.1);    sigmas <- seq(1, 4, length = 4)
(fit <- lapply(sigmas, function(sig)
   fnhat_ES2013(x = xgrid, data = d, K = dnorm, h = n^(-1/5),
     ranktrafo = J2, sigma = sig)) )

ymat <- sapply(fit, "[[", "y");     dfit <- density(d, bw = "sj")
plot(dfit, ylim = range(0, dfit$y, ymat), main = "", xlab = "")
rug(d, col = "red")
matlines(x = xgrid, y = ymat, lty = 1, col = 2 + seq(sigmas))
legend("top", lty = 1, col = c("black", "red", NA), bty = "n",
  legend = expression("R's est.", "data", hat(f)[n]~"in other colors"))
## End(No test)



