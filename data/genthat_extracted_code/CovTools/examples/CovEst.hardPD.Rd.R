library(CovTools)


### Name: CovEst.hardPD
### Title: Covariance Estimation via Hard Thresholding under
###   Positive-Definiteness Constraint
### Aliases: CovEst.hardPD

### ** Examples

## generate data from multivariate normal with Identity covariance.
data <- mvtnorm::rmvnorm(5, sigma=diag(10))

## apply 4 different schemes
out1 <- CovEst.hard(data, thr=0.1)  # threshold value 0.1
out2 <- CovEst.hard(data, thr=1)    # threshold value 1
out3 <- CovEst.hard(data, thr=10)   # threshold value 10
out4 <- CovEst.hardPD(data) # automatic threshold checking

## visualize 4 estimated matrices
mmessage <- paste("hardPD::optimal thr=",sprintf("%.2f",out4$optC),sep="")
par(mfrow=c(2,2), pty="s")
image(pracma::flipud(out1$S), col=gray((0:100)/100), main="thr=0.1")
image(pracma::flipud(out2$S), col=gray((0:100)/100), main="thr=1")
image(pracma::flipud(out3$S), col=gray((0:100)/100), main="thr=10")
image(pracma::flipud(out4$S), col=gray((0:100)/100), main=mmessage)




