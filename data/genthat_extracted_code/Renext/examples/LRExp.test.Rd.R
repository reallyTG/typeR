library(Renext)


### Name: LRExp.test
### Title: Likelihood Ratio test of exponentiality vs. GPD
### Aliases: LRExp.test

### ** Examples

set.seed(1234)
x <- rGPD(n = 50, loc = 0, scale = 1, shape = 0.1)
LRExp.test(x, method = "num")$p.value
LRExp.test(x, method = "asymp")$p.value
## Not run: 
##D ## requires much time
##D LRExp.test(x, method = "asymp")$p.value
## End(Not run)



