library(msgps)


### Name: summary.msgps
### Title: A summary of "msgps" object..
### Aliases: summary.msgps
### Keywords: models

### ** Examples

#data
X <- matrix(rnorm(100*8),100,8)
beta0 <- c(3,1.5,0,0,2,0,0,0)
epsilon <- rnorm(100,sd=3)
y <- X %*% beta0 + epsilon
y <- c(y)

#fit
fit <- msgps(X,y)
summary(fit) 



