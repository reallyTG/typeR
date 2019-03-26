## ----setup, include=FALSE------------------------------------------------
library(knitr)
opts_chunk$set(out.extra='style="display:block; margin: auto"', fig.align="center", tidy=FALSE)

## ----pack, message=F, warning=F------------------------------------------
# microbenchmark does not work on all platforms, hence we need this small wrapper 
microwrapper <- function(..., times = 100L){
  ok <- "microbenchmark" %in% rownames(installed.packages())
  if( ok ){ 
    library("microbenchmark") 
    microbenchmark(list = match.call(expand.dots = FALSE)$..., times = times)
  }else{
    message("microbenchmark package is not installed")
    return( invisible(NULL) )
  }
}

library("mvtnorm")
library("mvnfast")
library("MASS")
# We might also need to turn off BLAS parallelism 
library("RhpcBLASctl")
blas_set_num_threads(1)

N <- 10000
d <- 20

# Creating mean and covariance matrix
mu <- 1:d
tmp <- matrix(rnorm(d^2), d, d)
mcov <- tcrossprod(tmp, tmp)

microwrapper(rmvn(N, mu, mcov, ncores = 2),
             rmvn(N, mu, mcov),
             rmvnorm(N, mu, mcov),
             mvrnorm(N, mu, mcov))

## ----rmvt----------------------------------------------------------------
# Here we have a conflict between namespaces
microwrapper(mvnfast::rmvt(N, mu, mcov, df = 3, ncores = 2),
             mvnfast::rmvt(N, mu, mcov, df = 3),
             mvtnorm::rmvt(N, delta = mu, sigma = mcov, df = 3))

## ----rmvnA---------------------------------------------------------------
A <- matrix(nrow = N, ncol = d)
class(A) <- "numeric" # This is important. We need the elements of A to be of class "numeric".  

rmvn(N, mu, mcov, A = A) 

## ----rmvnA1--------------------------------------------------------------
A[1:2, 1:5]             

## ----rmvnA2--------------------------------------------------------------
microwrapper(rmvn(N, mu, mcov, ncores = 2, A = A),
             rmvn(N, mu, mcov, ncores = 2), 
             times = 200)

## ----dmvn----------------------------------------------------------------
# Generating random vectors 
N <- 10000
d <- 20
mu <- 1:d
tmp <- matrix(rnorm(d^2), d, d)
mcov <- tcrossprod(tmp, tmp)
X <- rmvn(N, mu, mcov)

microwrapper(dmvn(X, mu, mcov, ncores = 2, log = T),
             dmvn(X, mu, mcov, log = T),
             dmvnorm(X, mu, mcov, log = T), times = 500)

## ----dmvt----------------------------------------------------------------
# We have a namespace conflict
microwrapper(mvnfast::dmvt(X, mu, mcov, df = 4, ncores = 2, log = T),
             mvnfast::dmvt(X, mu, mcov, df = 4, log = T),
             mvtnorm::dmvt(X, delta = mu, sigma = mcov, df = 4, log = T), times = 500)

## ----maha----------------------------------------------------------------
# Generating random vectors 
N <- 10000
d <- 20
mu <- 1:d
tmp <- matrix(rnorm(d^2), d, d)
mcov <- tcrossprod(tmp, tmp)
X <- rmvn(N, mu, mcov)

microwrapper(maha(X, mu, mcov, ncores = 2),
             maha(X, mu, mcov),
             mahalanobis(X, mu, mcov))

## ----mixSim--------------------------------------------------------------
set.seed(5135)
N <- 10000
d <- 2
mu1 <- c(0, 0); mu2 <- c(2, 3)
Cov1 <- matrix(c(1, 0, 0, 2), 2, 2)
Cov2 <- matrix(c(1, -0.9, -0.9, 1), 2, 2)

bin <- rbinom(N, 1, 0.5)

X <- bin * rmvn(N, mu1, Cov1) + (!bin) * rmvn(N, mu2, Cov2)

## ----mixPlot-------------------------------------------------------------
# Plotting
np <- 100
xvals <- seq(min(X[ , 1]), max(X[ , 1]), length.out = np)
yvals <- seq(min(X[ , 2]), max(X[ , 2]), length.out = np)
theGrid <- expand.grid(xvals, yvals) 
theGrid <- as.matrix(theGrid)
dens <- dmixn(theGrid, 
              mu = rbind(mu1, mu2), 
              sigma = list(Cov1, Cov2), 
              w = rep(1, 2)/2)
plot(X[ , 1], X[ , 2], pch = '.', lwd = 0.01, col = 3)
contour(x = xvals, y = yvals, z = matrix(dens, np, np),
        levels = c(0.002, 0.01, 0.02, 0.04, 0.08, 0.15 ), add = TRUE, lwd = 2)

# Mean-shift
library(plyr)
inits <- matrix(c(-2, 2, 0, 3, 4, 3, 2, 5, 2, -3, 2, 2, 0, 2, 3, 0, 0, -4, -2, 6), 
                10, 2, byrow = TRUE)
traj <- alply(inits,
              1,
              function(input)
                  ms(X = X, 
                     init = input, 
                     H = 0.05 * cov(X), 
                     ncores = 2, 
                     store = TRUE)$traj
              )

invisible( lapply(traj, 
                  function(input){ 
                    lines(input[ , 1], input[ , 2], col = 2, lwd = 1.5)
                    points(tail(input[ , 1]), tail(input[ , 2]))
           }))

