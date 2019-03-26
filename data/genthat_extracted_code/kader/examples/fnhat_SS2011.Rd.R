library(kader)


### Name: fnhat_SS2011
### Title: (Non-robust) Kernel Density Estimator of Srihera & Stute (2011)
### Aliases: fnhat_SS2011

### ** Examples

require(stats);   require(grDevices);    require(datasets)

 # Simulated N(0,1)-data and one sigma-value
set.seed(2017);     n <- 100;     d <- rnorm(n)
xgrid <- seq(-4, 4, by = 0.1)
(fit <- fnhat_SS2011(x = xgrid, data = d, K = dnorm, h = n^(-1/5),
  theta = mean(d), sigma = 1))
## No test: 
plot(fit, ylim = range(0, dnorm(0), fit$y), col = "blue")
curve(dnorm, add = TRUE);   rug(d, col = "red")
legend("topleft", lty = 1, col = c("blue", "black", "red"),
  legend = expression(tilde(f)[n], phi, "data")) 
## End(No test)
## No test: 
 # The same data, but several sigma-values
sigmas <- seq(1, 4, length = 4)
(fit <- lapply(sigmas, function(sig)
  fnhat_SS2011(x = xgrid, data = d, K = dnorm, h = n^(-1/5),
    theta = mean(d), sigma = sig)))

ymat <- sapply(fit, "[[", "y")
matplot(x = xgrid, y = ymat, type = "l", lty = 1, col = 3:6,
  ylim = range(0, dnorm(0), ymat), main = "", xlab = "", ylab = "Density")
curve(dnorm, add = TRUE);   rug(d, col = "red")
legend("topleft", lty = 1, col = c("black", "red", NA), bty = "n",
  legend = expression(phi, "data", tilde(f)[n]~"in other colors")) 
## End(No test)
## No test: 
 # Old-Faithful-eruptions-data and several sigma-values
d <- faithful$eruptions;     n <- length(d);     er <- extendrange(d)
xgrid <- seq(er[1], er[2], by = 0.1);    sigmas <- seq(1, 4, length = 4)
(fit <- lapply(sigmas, function(sig)
   fnhat_SS2011(x = xgrid, data = d, K = dnorm, h = n^(-1/5),
     theta = mean(d), sigma = sig)))

ymat <- sapply(fit, "[[", "y");     dfit <- density(d, bw = "sj")
plot(dfit, ylim = range(0, dfit$y, ymat), main = "", xlab = "")
rug(d, col = "red")
matlines(x = xgrid, y = ymat, lty = 1, col = 3:6)
legend("top", lty = 1, col = c("black", "red", NA), bty = "n",
  legend = expression("R's est.", "data", tilde(f)[n]~"in other colors")) 
## End(No test)



