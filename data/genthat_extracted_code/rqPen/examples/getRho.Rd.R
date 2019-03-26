library(rqPen)


### Name: getRho
### Title: Objective Function Value
### Aliases: getRho

### ** Examples

x <- matrix(rnorm(800),nrow=100)
y <- 1 + x[,1] - 3*x[,5] + rnorm(100)
lassoModel <- rq.lasso.fit(x,y,lambda=.5)
getRho(lassoModel)



