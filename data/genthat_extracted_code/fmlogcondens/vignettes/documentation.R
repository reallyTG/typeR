## ----setup, include = FALSE----------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>",
  fig.width=7, 
  fig.height=4
)

## ----eval=FALSE----------------------------------------------------------
#  install.packages("fmlogcondens")

## ----eval=FALSE----------------------------------------------------------
#  install.packages("path-to-package/fmlogcondens_1.0.0.tar.gz", type = "source")

## ----message=FALSE-------------------------------------------------------
library(fmlogcondens)

## ----message=FALSE-------------------------------------------------------
set.seed(222)
X = matrix(rnorm(200), 100, 2)
r <- fmlcd(X) # estimate log-concave density

## ----message=FALSE,  out.width = "100%",  out.extra='style="border-color:#FFF;"'----
library(LogConcDEAD)
r <- LogConcDEAD::getinfolcd(X, r$logMLE) # create a `LogConcDEAD` object

par(mfrow = c(1, 2)) #square plots
plot(r, addp = FALSE, asp = 1, main="density")
plot(r, uselog = TRUE, addp = FALSE, asp = 1, main="log density")

## ------------------------------------------------------------------------
# evaluate density for the point (0,0)
x <- c(0,0)
LogConcDEAD::dlcd(x,r)
# sample 10 points from the estimated density
LogConcDEAD::rlcd(10,r)

## ----message=FALSE, out.width = "100%", out.extra='style="border-color:#FFF;"'----
rCule <- LogConcDEAD::mlelcd(X)

par(mfrow = c(1, 2)) #square plots
plot(rCule, addp=  FALSE, asp = 1, main = "density [LogConcDEAD]")
plot(rCule, uselog = TRUE, addp = FALSE, asp = 1, main = "log density [LogConcDEAD]")

## ----message=FALSE-------------------------------------------------------
set.seed(222)
X = matrix(rnorm(1000), 500, 2)
# time estimate for our approach
system.time(r <- fmlcd(X))
# time estimate for the approach of Cule et al.
system.time(rCule <- mlelcd(X))

## ----message=FALSE, out.extra='style="border-color:#FFF;"'---------------
r <- LogConcDEAD::getinfolcd(X, r$logMLE) # create a `LogConcDEAD` object
# plot bost estimates for comparison
par(mfrow=c(1, 2)) #square plots
plot(r, addp = FALSE, asp = 1, main="density")
plot(rCule, addp = FALSE, asp = 1, main="density [LogConcDEAD]")

## ------------------------------------------------------------------------
library(MASS)
set.seed(222)
X1 <- mvrnorm(200, c(0, 0), matrix(c(2, 1.5, 1.5, 2), 2, 2))
X2 <- mvrnorm(200, c(-2, 2), matrix(c(1, 0, 0, 1), 2, 2))
plot(X1[ ,1], X1[ ,2], col="red", pch = 20, xlab = "X", ylab = "Y")
points(X2[ ,1], X2[ ,2], col="blue", pch = 20)

## ------------------------------------------------------------------------
X <- rbind(X1,X2) # stack both data matrices
r <- fmlcdEM(X, K = 2)

## ------------------------------------------------------------------------
# Create a grid of points for evaluation
x <- seq(min(X[ ,1]), max(X[ ,1]), 0.1)
y <- seq(min(X[ ,2]), max(X[ ,2]), 0.1)
m <- length(x); n <- length(y)
XEval = cbind(matrix(rep(x, each = n), ncol = 1), matrix(rep(y, m), ncol = 1))
nX = dim(XEval)[1]

# evaluate log-concave density component-wise
YA = exp(apply(- r$params[[1]]$a %*% t(XEval) - matrix(rep(r$params[[1]]$b,nX),length(r$params[[1]]$b),nX), 2, min))
YB = exp(apply(- r$params[[2]]$a %*% t(XEval) - matrix(rep(r$params[[2]]$b,nX),length(r$params[[2]]$b),nX), 2, min))
Y = YA * r$tau[1] + YB * r$tau[2]

contour(x,y,t(matrix(Y,n,m)), xlab = "X", ylab = "Y")
points(X1[ ,1], X1[ ,2], col="red", pch = 20, cex=.5)
points(X2[ ,1], X2[ ,2], col="blue", pch = 20, cex=.5)

