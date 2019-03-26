library(ALEPlot)


### Name: ALEPlot
### Title: Accumulated Local Effects (ALE) Plots
### Aliases: ALEPlot
### Keywords: models

### ** Examples

########################################################################
## A transparent example in which the supervised learning model is a linear regression \code{lm},
## but we will pretend it is black-box
########################################################################

## Generate some data and fit a \code{lm} supervised learning model
N=500
x1 <- runif(N, min=0, max=1)
x2 <- runif(N, min=0, max=1)
x3 <- runif(N, min=0, max=1)
y = x1 + 2*x2^2 + rnorm(N, 0, 0.1)
DAT = data.frame(y, x1, x2, x3)
lm.DAT = lm(y ~ .^2 + I(x1^2) + I(x2^2) + I(x3^2), DAT)

## Define the predictive function (easy in this case, since \code{lm} has a built-in 
## predict function that suffices)
yhat <- function(X.model, newdata) as.numeric(predict(X.model, newdata))

## Calculate and plot the ALE main and second-order interaction effects of x1, x2, x3
par(mfrow = c(2,3))
ALE.1=ALEPlot(DAT[,2:4], lm.DAT, pred.fun=yhat, J=1, K=50, NA.plot = TRUE)
ALE.2=ALEPlot(DAT[,2:4], lm.DAT, pred.fun=yhat, J=2, K=50, NA.plot = TRUE)
ALE.3=ALEPlot(DAT[,2:4], lm.DAT, pred.fun=yhat, J=3, K=50, NA.plot = TRUE)
ALE.12=ALEPlot(DAT[,2:4], lm.DAT, pred.fun=yhat, J=c(1,2), K=20, NA.plot = TRUE)
ALE.13=ALEPlot(DAT[,2:4], lm.DAT, pred.fun=yhat, J=c(1,3), K=20, NA.plot = TRUE)
ALE.23=ALEPlot(DAT[,2:4], lm.DAT, pred.fun=yhat, J=c(2,3), K=20, NA.plot = TRUE)

## The following manually recreates the same plots produced by the above ALEPlot function calls
par(mfrow = c(2,3))
plot(ALE.1$x.values, ALE.1$f.values, type="l", xlab="x1", ylab="ALE main effect for x1")
plot(ALE.2$x.values, ALE.2$f.values, type="l", xlab="x2", ylab="ALE main effect for x2")
plot(ALE.3$x.values, ALE.3$f.values, type="l", xlab="x3", ylab="ALE main effect for x3")
image(ALE.12$x.values[[1]], ALE.12$x.values[[2]], ALE.12$f.values, xlab = "x1", ylab = "x2")
contour(ALE.12$x.values[[1]], ALE.12$x.values[[2]], ALE.12$f.values, add=TRUE, drawlabels=TRUE)
image(ALE.13$x.values[[1]], ALE.13$x.values[[2]], ALE.13$f.values, xlab = "x1", ylab = "x3")
contour(ALE.13$x.values[[1]], ALE.13$x.values[[2]], ALE.13$f.values, add=TRUE, drawlabels=TRUE)
image(ALE.23$x.values[[1]], ALE.23$x.values[[2]], ALE.23$f.values, xlab = "x2", ylab = "x3")
contour(ALE.23$x.values[[1]], ALE.23$x.values[[2]], ALE.23$f.values, add=TRUE, drawlabels=TRUE)

## No test: 
       
########################################################################
## A larger example in which the supervised learning model is a neural network (\code{nnet})
########################################################################

## Generate some data and fit a \code{nnet} supervised learning model

library(nnet)
N=5000
x1 <- runif(N, min=0, max=1)
x2 <- runif(N, min=0, max=1)
x3 <- runif(N, min=0, max=1)
y = x1 + 2*x2^2 +(x1-0.5)*(x3-0.5) + rnorm(N, 0, 0.1)
DAT = data.frame(y, x1, x2, x3)
nnet.DAT<-nnet(y~., data=DAT, linout=TRUE, skip=FALSE, size=10, decay=0.01, 
	maxit=1000, trace=FALSE)

## Define the predictive function
yhat <- function(X.model, newdata) as.numeric(predict(X.model, newdata, type="raw"))

## Calculate and plot the ALE main and second-order interaction effects of x1, x2, x3
par(mfrow = c(2,3))
ALE.1=ALEPlot(DAT[,2:4], nnet.DAT, pred.fun=yhat, J=1, K=50, NA.plot = TRUE)
ALE.2=ALEPlot(DAT[,2:4], nnet.DAT, pred.fun=yhat, J=2, K=50, NA.plot = TRUE)
ALE.3=ALEPlot(DAT[,2:4], nnet.DAT, pred.fun=yhat, J=3, K=50, NA.plot = TRUE)
ALE.12=ALEPlot(DAT[,2:4], nnet.DAT, pred.fun=yhat, J=c(1,2), K=20, NA.plot = TRUE)
ALE.13=ALEPlot(DAT[,2:4], nnet.DAT, pred.fun=yhat, J=c(1,3), K=20, NA.plot = TRUE)
ALE.23=ALEPlot(DAT[,2:4], nnet.DAT, pred.fun=yhat, J=c(2,3), K=20, NA.plot = TRUE)

########################################################################
## A binary classification example in which the supervised learning model is 
## a neural network (\code{nnet}), and the log-odds of the predicted class probability 
## is the function to be plotted
########################################################################

## Generate some data and fit a \code{nnet} supervised learning model

library(nnet)
N=5000
x1 <- runif(N, min=0, max=1)
x2 <- runif(N, min=0, max=1)
x3 <- runif(N, min=0, max=1)
z = -3.21 + 2.81*x1 + 5.62*x2^2 + 2.81*(x1-0.5)*(x3-0.5) #true log-odds
p = exp(z)/(1+exp(z))
u = runif(N)
y = u < p
DAT = data.frame(y, x1, x2, x3)
nnet.DAT<-nnet(y~., data=DAT, linout=FALSE, skip=FALSE, size=10, decay=0.05, 
	maxit=1000, trace=FALSE)

## Define the ALE function to be the log-odds of the predicted probability that y = TRUE
yhat <- function(X.model, newdata) {
    p.hat = as.numeric(predict(X.model, newdata, type="raw"))
    log(p.hat/(1-p.hat))
}

## Calculate and plot the ALE main and second-order interaction effects of x1, x2, x3
par(mfrow = c(2,3))
ALE.1=ALEPlot(DAT[,2:4], nnet.DAT, pred.fun=yhat, J=1, K=50, NA.plot = TRUE)
ALE.2=ALEPlot(DAT[,2:4], nnet.DAT, pred.fun=yhat, J=2, K=50, NA.plot = TRUE)
ALE.3=ALEPlot(DAT[,2:4], nnet.DAT, pred.fun=yhat, J=3, K=50, NA.plot = TRUE)
ALE.12=ALEPlot(DAT[,2:4], nnet.DAT, pred.fun=yhat, J=c(1,2), K=20, NA.plot = TRUE)
ALE.13=ALEPlot(DAT[,2:4], nnet.DAT, pred.fun=yhat, J=c(1,3), K=20, NA.plot = TRUE)
ALE.23=ALEPlot(DAT[,2:4], nnet.DAT, pred.fun=yhat, J=c(2,3), K=20, NA.plot = TRUE)

## End(No test)



