library(CovTools)


### Name: CovEst.soft
### Title: Covariance Estimation via Soft Thresholding
### Aliases: CovEst.soft

### ** Examples

## generate data from multivariate normal with Identity covariance.
data <- mvtnorm::rmvnorm(10, sigma=diag(10))

## apply 4 different schemes
#  mthr is a vector of regularization parameters to be tested
mthr <- exp(seq(from=log(0.1),to=log(10),length.out=10))

out1 <- CovEst.soft(data, thr=0.1)  # threshold value 0.1
out2 <- CovEst.soft(data, thr=1)    # threshold value 1
out3 <- CovEst.soft(data, thr=10)   # threshold value 10
out4 <- CovEst.soft(data, thr=mthr) # automatic threshold checking

## visualize 4 estimated matrices
par(mfrow=c(2,2), pty="s")
image(pracma::flipud(out1$S), col=gray((0:100)/100), main="thr=0.1")
image(pracma::flipud(out2$S), col=gray((0:100)/100), main="thr=1")
image(pracma::flipud(out3$S), col=gray((0:100)/100), main="thr=10")
image(pracma::flipud(out4$S), col=gray((0:100)/100), main="automatic")





