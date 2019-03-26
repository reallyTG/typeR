library(CovTools)


### Name: PreEst.2017Lee
### Title: Bayesian Estimation of a Banded Precision Matrix (Lee 2017)
### Aliases: PreEst.2017Lee

### ** Examples

## generate data from multivariate normal with Identity precision.
data = mvtnorm::rmvnorm(100, sigma=diag(10))

## compare different K
out1 <- PreEst.2017Lee(data, upperK=1)
out2 <- PreEst.2017Lee(data, upperK=3)
out3 <- PreEst.2017Lee(data, upperK=5)

## visualize
par(mfrow=c(2,2), pty="s")
image(pracma::flipud(diag(10)),main="Original Precision")
image(pracma::flipud(out1$C), main="banded2::upperK=1")
image(pracma::flipud(out2$C), main="banded2::upperK=3")
image(pracma::flipud(out3$C), main="banded2::upperK=5")




