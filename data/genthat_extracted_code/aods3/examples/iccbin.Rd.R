library(aods3)


### Name: iccbin
### Title: Intra-Cluster Correlation for Clustered Binomial data
### Aliases: iccbin print.iccbin
### Keywords: datagen

### ** Examples

data(rats)
z <- rats[rats$group == "TREAT", ]
# A: glmm (model linearization)
iccbin(z$n, z$m, method = "A")
iccbin(z$n, z$m, method = "A", nAGQ = 10)
# B: glmm (Monte Carlo)
iccbin(z$n, z$m, method = "B")
iccbin(z$n, z$m, method = "B", nAGQ = 10, M = 1500)
# C: lmm (ANOVA moments)
iccbin(z$n, z$m, method = "C")

## Not run: 
##D   # Example of CI calculation with nonparametric bootstrap
##D   require(boot)
##D   foo <- function(X, ind) {
##D     n <- X$n[ind]
##D     m <- X$m[ind]
##D     iccbin(n = n, m = m, method = "C")$rho
##D     }
##D   res <- boot(data = z[, c("n", "m")], statistic = foo, R = 500, sim = "ordinary", stype = "i")
##D   res
##D   boot.ci(res, conf = 0.95, type = "basic")
##D   
## End(Not run)
  



