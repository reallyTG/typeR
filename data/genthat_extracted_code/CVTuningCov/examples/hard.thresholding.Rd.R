library(CVTuningCov)


### Name: hard.thresholding
### Title: Hard-thresholding Operator on A Covariance Matrix
### Aliases: hard.thresholding
### Keywords: thresholding

### ** Examples

p <- 5;
Sigma <- AR1(p, rho=0.6);
hard.Sigma<-hard.thresholding(Sigma,c=0.5);
hard.Sigma;



