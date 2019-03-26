library(ALEPlot)


### Name: PDPlot
### Title: Partial Dependence (PD) Plots
### Aliases: PDPlot
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

## Define the predictive function (easy in this case, since \code{lm} has 
## a built-in predict function that suffices)
yhat <- function(X.model, newdata) as.numeric(predict(X.model, newdata))

## Calculate and plot the PD main effects and second-order interaction effects of x1, x2, x3
par(mfrow = c(2,3))
PD.1=PDPlot(DAT[,2:4], lm.DAT, pred.fun=yhat, J=1, K=50)
PD.2=PDPlot(DAT[,2:4], lm.DAT, pred.fun=yhat, J=2, K=50)
PD.3=PDPlot(DAT[,2:4], lm.DAT, pred.fun=yhat, J=3, K=50)
PD.12=PDPlot(DAT[,2:4], lm.DAT, pred.fun=yhat, J=c(1,2), K=30)
PD.13=PDPlot(DAT[,2:4], lm.DAT, pred.fun=yhat, J=c(1,3), K=30)
PD.23=PDPlot(DAT[,2:4], lm.DAT, pred.fun=yhat, J=c(2,3), K=30)

## The following manually recreates the same plots produced by the above PDPlot function calls
par(mfrow = c(2,3))
plot(PD.1$x.values, PD.1$f.values, type="l", xlab="x1", ylab="PD main effect for x1")
plot(PD.2$x.values, PD.2$f.values, type="l", xlab="x2", ylab="PD main effect for x2")
plot(PD.3$x.values, PD.3$f.values, type="l", xlab="x3", ylab="PD main effect for x3")
image(PD.12$x.values[[1]], PD.12$x.values[[2]], PD.12$f.values, xlab = "x1", ylab = "x2")
contour(PD.12$x.values[[1]], PD.12$x.values[[2]], PD.12$f.values, add=TRUE, drawlabels=TRUE)
image(PD.13$x.values[[1]], PD.13$x.values[[2]], PD.13$f.values, xlab = "x1", ylab = "x3")
contour(PD.13$x.values[[1]], PD.13$x.values[[2]], PD.13$f.values, add=TRUE, drawlabels=TRUE)
image(PD.23$x.values[[1]], PD.23$x.values[[2]], PD.23$f.values, xlab = "x2", ylab = "x3")
contour(PD.23$x.values[[1]], PD.23$x.values[[2]], PD.23$f.values, add=TRUE, drawlabels=TRUE)

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

## Calculate and plot the PD main and second-order interaction effects of x1, x2, x3
par(mfrow = c(2,3))
PD.1=PDPlot(DAT[,2:4], nnet.DAT, pred.fun=yhat, J=1, K=50)
PD.2=PDPlot(DAT[,2:4], nnet.DAT, pred.fun=yhat, J=2, K=50)
PD.3=PDPlot(DAT[,2:4], nnet.DAT, pred.fun=yhat, J=3, K=50)
PD.12=PDPlot(DAT[,2:4], nnet.DAT, pred.fun=yhat, J=c(1,2), K=20)
PD.13=PDPlot(DAT[,2:4], nnet.DAT, pred.fun=yhat, J=c(1,3), K=20)
PD.23=PDPlot(DAT[,2:4], nnet.DAT, pred.fun=yhat, J=c(2,3), K=20)
       
########################################################################
## A binary classification example in which the supervised learning model is 
## a neural network (\code{nnet}), and the log-odds of the predicted class 
## probability is the function to be plotted
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

## Calculate and plot the PD main and second-order interaction effects of x1, x2, x3
par(mfrow = c(2,3))
PD.1=PDPlot(DAT[,2:4], nnet.DAT, pred.fun=yhat, J=1, K=50)
PD.2=PDPlot(DAT[,2:4], nnet.DAT, pred.fun=yhat, J=2, K=50)
PD.3=PDPlot(DAT[,2:4], nnet.DAT, pred.fun=yhat, J=3, K=50)
PD.12=PDPlot(DAT[,2:4], nnet.DAT, pred.fun=yhat, J=c(1,2), K=20)
PD.13=PDPlot(DAT[,2:4], nnet.DAT, pred.fun=yhat, J=c(1,3), K=20)
PD.23=PDPlot(DAT[,2:4], nnet.DAT, pred.fun=yhat, J=c(2,3), K=20)
## End(No test)



