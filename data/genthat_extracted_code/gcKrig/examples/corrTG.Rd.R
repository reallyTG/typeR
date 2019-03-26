library(gcKrig)


### Name: corrTG
### Title: Compute the Correlation in Transformed Gaussian Random Fields
### Aliases: corrTG
### Keywords: Correlation Structure

### ** Examples

## Not run: 
##D corrTG(marg1 = poisson.gc(lambda = 10), marg2 = binomial.gc(size = 1, prob = 0.1),
##D        corrGauss = 0.5, method = "integral")
##D set.seed(12345)
##D corrTG(marg1 = poisson.gc(lambda = 10), marg2 = binomial.gc(size = 1, prob = 0.1),
##D        corrGauss = 0.5, nrep = 100000, method = "mc")
## End(Not run)



