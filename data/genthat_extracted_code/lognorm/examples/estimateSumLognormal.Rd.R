library(lognorm)


### Name: estimateSumLognormal
### Title: estimateSumLognormal
### Aliases: estimateSumLognormal

### ** Examples

# distribution of the sum of two lognormally distributed random variables
mu1 = log(110)
mu2 = log(100)
sigma1 = log(1.2)
sigma2 = log(1.6)
(coefSum <- estimateSumLognormal( c(mu1,mu2), c(sigma1,sigma2) ))
# repeat with correlation
(coefSumCor <- estimateSumLognormal( c(mu1,mu2), c(sigma1,sigma2), effAcf = c(1,0.9) ))
# expected value is equal, but variance with correlated variables is larger
getLognormMoments(coefSum["mu"],coefSum["sigma"])
getLognormMoments(coefSumCor["mu"],coefSumCor["sigma"])



