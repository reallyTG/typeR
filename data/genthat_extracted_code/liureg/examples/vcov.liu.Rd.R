library(liureg)


### Name: vcov.liu
### Title: Variance-Covariance Matrix for Fitted Liu Model
### Aliases: vcov.liu vcov
### Keywords: Liu Variance Covariance Matrix

### ** Examples

data(Hald)
mod<- liu(y~., data = as.data.frame(Hald), scaling = "centered", d = seq(-2, 2, 0.1) )

vcov(mod)



