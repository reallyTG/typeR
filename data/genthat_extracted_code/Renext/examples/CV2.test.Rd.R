library(Renext)


### Name: CV2.test
### Title: CV2 test of exponentiality
### Aliases: CV2.test

### ** Examples

n <- 30; nSamp <- 500
X <- matrix(rexp(n * nSamp), nrow = nSamp, ncol = n)
pVals <- apply(X, 1, function(x) CV2.test(x)$p.value)
plot(pVals)  ## should be uniform on (0, 1)



