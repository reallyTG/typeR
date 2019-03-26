library(logcondens)


### Name: logconTwoSample
### Title: Compute p-values for two-sample test based on log-concave CDF
###   estimates
### Aliases: logconTwoSample
### Keywords: htest nonparametric

### ** Examples

## Not run: 
##D n1 <- 30
##D n2 <- 25
##D x <- rgamma(n1, 2, 1)
##D y <- rgamma(n2, 2, 1) + 1
##D twosample <- logconTwoSample(x, y, which = c("MLE", "smooth")[1], M = 999)
## End(Not run)



