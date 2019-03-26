library(CovTools)


### Name: PreEst.2014Banerjee
### Title: Bayesian Estimation of a Banded Precision Matrix (Banerjee 2014)
### Aliases: PreEst.2014Banerjee

### ** Examples

## generate data from multivariate normal with Identity precision.
data = mvtnorm::rmvnorm(100, sigma=diag(10))

## compare different K
out1 <- PreEst.2014Banerjee(data, upperK=1)
out2 <- PreEst.2014Banerjee(data, upperK=3)
out3 <- PreEst.2014Banerjee(data, upperK=5)

## visualize
par(mfrow=c(2,2), pty="s")
image(pracma::flipud(diag(10)),main="Original Precision")
image(pracma::flipud(out1$C), main="banded1::upperK=1")
image(pracma::flipud(out2$C), main="banded1::upperK=3")
image(pracma::flipud(out3$C), main="banded1::upperK=5")




