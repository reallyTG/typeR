library(PUlasso)


### Name: PUlasso-package
### Title: PUlasso : An efficient algorithm to solve Positive and
###   Unlabelled(PU) problem with lasso or group lasso penalty
### Aliases: PUlasso PUlasso-package
### Keywords: Group Lasso Lasso, PUlearning,

### ** Examples

vignette("PUlasso-vignette")  
data("simulPU")
fit<-grpPUlasso(X=simulPU$X,z=simulPU$z,pi=simulPU$truePY1)
cvfit<-cv.grpPUlasso(X=simulPU$X,z=simulPU$z,pi=simulPU$truePY1)
coef(fit,lambda=fit$lambda[10])
predict(cvfit,newdata = head(simulPU$X), lambda=cvfit$lambda.1se,type = "response")



