library(ks)


### Name: kroc
### Title: Kernel receiver operating characteristic (ROC) curve
### Aliases: kroc predict.kroc summary.kroc
### Keywords: smooth

### ** Examples

samp <- 1000
x <- rnorm.mixt(n=samp, mus=0, sigmas=1, props=1)
y <- rnorm.mixt(n=samp, mus=0.5, sigmas=1, props=1)
Rhat <- kroc(x1=x, x2=y)
summary(Rhat)
predict(Rhat, x=0.5) 



