library(CovTools)


### Name: CovEst.nearPD
### Title: Covariance Estimation via Nearest Positive-Definite Matrix
###   Projection
### Aliases: CovEst.nearPD

### ** Examples

## generate data from multivariate normal with Identity covariance.
data <- mvtnorm::rmvnorm(3, sigma=diag(10))

## compare against sample covariance
out1 <- cov(data)
out2 <- CovEst.nearPD(data) # apply nearPD

## visualize 2 estimated matrices
par(mfrow=c(1,2), pty="s")
image(pracma::flipud(out1), col=gray((0:100)/100), main="sample covariance")
image(pracma::flipud(out2$S), col=gray((0:100)/100), main="SPD Projection")




