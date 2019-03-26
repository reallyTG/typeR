library(gencve)


### Name: yhat_SVM
### Title: Support Vector Machine Regression Prediction
### Aliases: yhat_SVM

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
yhat_SVM(trdf, tedf)



