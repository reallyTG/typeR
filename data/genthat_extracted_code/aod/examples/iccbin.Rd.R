library(aod)


### Name: iccbin
### Title: Intra-Cluster Correlation for Binomial Data
### Aliases: iccbin show,iccbin-method
### Keywords: htest

### ** Examples


data(rats)
tmp <- rats[rats$group == "TREAT", ]
# A: glmm (model linearization)
iccbin(n, y, data = tmp, method = "A")
iccbin(n, y, data = tmp, method = "A", nAGQ = 10)
# B: glmm (Monte Carlo)
iccbin(n, y, data = tmp, method = "B")
iccbin(n, y, data = tmp, method = "B", nAGQ = 10, M = 1500)
# C: lmm (ANOVA moments)
iccbin(n, y, data = tmp, method = "C")

  ## Not run: 
##D   # Example of confidence interval calculation with nonparametric bootstrap
##D   require(boot)
##D   foo <- function(X, ind) {
##D     n <- X$n[ind]
##D     y <- X$y[ind]
##D     X <- data.frame(n = n, y = y)
##D     iccbin(n = n, y = y, data = X, method = "C")@rho[1]
##D     }
##D   res <- boot(data = tmp[, c("n", "y")], statistic = foo, R = 500, sim = "ordinary", stype = "i")
##D   res
##D   boot.ci(res, conf = 0.95, type = "basic")
##D   
## End(Not run)




