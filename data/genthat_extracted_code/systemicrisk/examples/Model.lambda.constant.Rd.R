library(systemicrisk)


### Name: Model.lambda.constant
### Title: Model for a Constant lambda
### Aliases: Model.lambda.constant

### ** Examples

m <- Model.lambda.constant(n=5,lambda=0.25)
m$matr(m$rtheta())
lambda<-matrix(c(NA,1,1,1e-4,NA,1e-4,1e4,1e4,NA),nrow=3)
m <- Model.lambda.constant(n=3,lambda=lambda)
m$matr(m$rtheta())



