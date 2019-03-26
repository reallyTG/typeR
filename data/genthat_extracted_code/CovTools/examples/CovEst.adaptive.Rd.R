library(CovTools)


### Name: CovEst.adaptive
### Title: Covariance Estimation via Adaptive Thresholding
### Aliases: CovEst.adaptive

### ** Examples

## generate data from multivariate normal with Identity covariance.
data <- mvtnorm::rmvnorm(10, sigma=diag(10))

## apply 4 different schemes
#  mthr is a vector of regularization parameters to be tested
mthr <- seq(from=0.01,to=0.99,length.out=10)

out1 <- CovEst.adaptive(data, thr=0.1)  # threshold value 0.1
out2 <- CovEst.adaptive(data, thr=0.5)  # threshold value 0.5
out3 <- CovEst.adaptive(data, thr=0.5)  # threshold value 0.9
out4 <- CovEst.adaptive(data, thr=mthr) # automatic threshold checking

## visualize 4 estimated matrices
par(mfrow=c(2,2), pty="s")
image(pracma::flipud(out1$S), col=gray((0:100)/100), main="thr=0.1")
image(pracma::flipud(out2$S), col=gray((0:100)/100), main="thr=0.5")
image(pracma::flipud(out3$S), col=gray((0:100)/100), main="thr=0.9")
image(pracma::flipud(out4$S), col=gray((0:100)/100), main="automatic")




