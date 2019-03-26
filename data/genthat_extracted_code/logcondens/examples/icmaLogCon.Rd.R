library(logcondens)


### Name: icmaLogCon
### Title: Computes a Log-Concave Probability Density Estimate via an
###   Iterative Convex Minorant Algorithm
### Aliases: icmaLogCon
### Keywords: htest nonparametric

### ** Examples

set.seed(1977)
x <- rgamma(200, 2, 1)
## Not run: 
##D res <- icmaLogCon(x, T1 = 2000, robustif = TRUE, print = TRUE)
##D 
##D ## plot resulting functions
##D par(mfrow = c(2, 1), mar = c(3, 2, 1, 2))
##D plot(x, exp(res$phi), type = 'l'); rug(x)
##D plot(x, res$phi, type = 'l'); rug(x)
## End(Not run)



