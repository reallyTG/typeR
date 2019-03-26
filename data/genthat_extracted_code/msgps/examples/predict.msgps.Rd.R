library(msgps)


### Name: predict.msgps
### Title: make predictions from a "msgps" object.
### Aliases: predict.msgps coef.msgps coef.dfgps coef.step.dfgps
###   coefmat.dfgps
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
coef(fit) #extract coefficients at t selected by model selection criteria
coef(fit,c(0, 0.5, 2.5)) #extract coefficients at some values of t
predict(fit,X[1:10,]) #predict values at t selected by model selection criteria
predict(fit,X[1:10,],c(0, 0.5, 2.5)) #predict values at some values of t



