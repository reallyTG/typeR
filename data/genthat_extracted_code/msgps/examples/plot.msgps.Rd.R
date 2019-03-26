library(msgps)


### Name: plot.msgps
### Title: plot the solution path from a "msgps" object.
### Aliases: plot.msgps plot.df
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
plot(fit,criterion="cp") #plot the solution path with a model selected by Cp criterion



