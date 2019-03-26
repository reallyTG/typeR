library(expandFunctions)


### Name: Ydiagnostics
### Title: Informative plots for Y and Yhat
### Aliases: Ydiagnostics

### ** Examples

# The order here looks backwards, but is chosen to
# simulate a typical pair - Yhat will normally have
# a smaller range than Y.
set.seed(2)
nObs <- 100 # Number of observations
x <- stats::filter(rnorm(nObs),c(-0.99),
     method="recursive")
x <- x + (x^2) # Nonlinear component
myLags <- 0:2
X <- eTrim(eLag(x,myLags))
Y <- X[,+1,drop=FALSE]
X <- X[,-1,drop=FALSE]
lmObj <- lm(Y ~ X)
Yhat <- predict(lmObj)
Ydiagnostics(Y,Yhat)



