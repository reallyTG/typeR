library(freestats)


### Name: cv.work
### Title: K-fold cross validation
### Aliases: cv.work

### ** Examples

set.seed(188)
X <- rnorm(n=100,mean=3,sd=2)
y <- rnorm(100) + X
dat <- data.frame(y=y,X=X)
cv.work(fun=lm,k=5,data=dat,cost=cost.mse,response='y',formula=y~X)



