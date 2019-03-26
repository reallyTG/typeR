library(arfima)


### Name: predict.arfima
### Title: Predicts from a fitted object.
### Aliases: predict.arfima
### Keywords: ts

### ** Examples


## No test: 
set.seed(82365)
sim <- arfima.sim(1000, model = list(dfrac = 0.4, theta=0.9, dint = 1))
fit <- arfima(sim, order = c(0, 1, 1), back=TRUE)
fit
pred <- predict(fit, n.ahead = 5)
pred
plot(pred, numback=50)
#Predictions aren't really different due to the
#series.  Let's see what happens when we regress!

set.seed(23524)
#Forecast 5 ahead as before
#Note that we need to integrate the regressors, since time series regression
#usually assumes that regressors are of the same order as the series.
n.fore <- 5
X <- matrix(rnorm(3000+3*n.fore), ncol = 3)
X <- apply(X, 2, cumsum)
Xnew <- X[1001:1005,]
X <- X[1:1000,]
beta <- matrix(c(2, -.4, 6), ncol = 1)
simX <- sim + as.vector(X%*%beta)
fitX <- arfima(simX, order = c(0, 1, 1), xreg = X, back=TRUE)
fitX
#Let's compare predictions.
predX <- predict(fitX, n.ahead = n.fore, xreg = Xnew)
predX
plot(predX, numback = 50)
#With the mode we know is really there, it looks better.
fitX <- removeMode(fitX, 2)
predXnew <- predict(fitX, n.ahead = n.fore, xreg = Xnew)
predXnew
plot(predXnew, numback=50)

#
## End(No test)




