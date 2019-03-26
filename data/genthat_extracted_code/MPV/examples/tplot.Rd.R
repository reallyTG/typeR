library(MPV)


### Name: tplot
### Title: Graphical t Test for Regression
### Aliases: tplot
### Keywords: graphics

### ** Examples

# Jojoba oil data set
X <- p4.18[,-4]
y <- p4.18[,4]
tplot(X, y, type="hist", includeIntercept=FALSE)
title("Tests for Individual Coefficients in the Jojoba Oil Regression")
# Simulated data set where none of the predictors are in the true model:
set.seed(4571)
Z <- matrix(rnorm(400), ncol=10)
A <- matrix(rnorm(81), ncol=9)
simdata <- data.frame(Z[,1], crossprod(t(Z[,-1]),A))
names(simdata) <- c("y", paste("x", 1:9, sep=""))
X <- simdata[,-1]
y <- simdata[,1]
tplot(X, y, type="hist", includeIntercept=FALSE)
title("Tests for Individual Coefficients for the Simulated Data Set")
# NFL Data set:
X <- table.b1[,-1]
y <- table.b1[,1]
tplot(X, y, type="hist", includeIntercept=FALSE)
title("Tests for Individual Coefficients for the NFL Data Set")
# Simulated Data set where x8 is the only predictor in the true model:
X <- pathoeg[,-10]
y <- pathoeg[,10]
par(mfrow=c(2,2))
tplot(X, y)
tplot(X, y, type="QQ")



