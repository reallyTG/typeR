library(CVTuningCov)


### Name: soft.thresholding
### Title: Soft-thresholding Operator on A Covariance Matrix
### Aliases: soft.thresholding
### Keywords: thresholding

### ** Examples

p <- 5;
Sigma <- AR1(p, rho=0.6);
soft.Sigma<-soft.thresholding(Sigma,c=0.5);
soft.Sigma;



