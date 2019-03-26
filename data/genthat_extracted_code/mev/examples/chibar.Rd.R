library(mev)


### Name: chibar
### Title: Parametric estimates of \bar{chi}
### Aliases: chibar

### ** Examples

## Not run: 
##D set.seed(765)
##D # Max-stable model, chibar = 1
##D dat <- evd::rbvevd(n = 1000, dep = 0.5)
##D chibar(dat, "profile", qu = 0.5)
##D s <- seq(0.05,1, length = 30)
##D chibar_est <- t(sapply(s, function(keep){chibar(dat, "delta", qu = keep)}))
##D matplot(s, chibar_est, type = "l", col = c(1, 2, 2),  lty = c(1, 2, 2),
##D  ylab = expression(bar(chi)), xlab = "p")
##D abline(h = 1, lty = 3, col = "grey")
##D # Multivariate normal sample, chibar = 0 - strong asymptotic independence at penultimate level
##D dat <- mvrnorm(n = 1000, mu = c(0, 0), Sigma = cbind(c(1, 0.75), c(0.75, 1)))
##D chibar(dat, "tem", q = 0.1)
##D chibar_est <- t(sapply(s, function(keep){chibar(dat, "profile", qu = keep)}))
##D matplot(s, chibar_est, type = "l", col = c(1, 2, 2),  lty = c(1, 2, 2),
##D  ylab = expression(bar(chi)), xlab = "p")
##D abline(h = 1, lty = 3, col = "grey")
## End(Not run)



