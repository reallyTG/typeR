library(gencve)


### Name: yhat_step
### Title: Backward Stagewise Regression with AIC or BIC
### Aliases: yhat_step
### Keywords: models regression

### ** Examples

Xy <- prostate
X <- prostate[,-9]
y <- prostate[,9]
n <- length(y)
d <- 10
set.seed(777513)
iTe <- sample(n, size=d)
iTr <- (1:n)[!match(1:n, iTe, nomatch = 0) > 0]
trdf <- data.frame(X[iTr,], y=y[iTr]) #X, y already defined
tedf <- data.frame(X[iTe,], y=y[iTe])
yhat_step(trdf, tedf)



