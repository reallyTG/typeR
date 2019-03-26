#--- pgnet model (precompiled) -------------------------------------------------

#library(msde)
context("pgnet model -- (precompiled)")

# setup model
model <- sde.examples(model = "pgnet")
## ModelFile <- "pgnetModel.h"
## param.names <- paste0("theta", 1:8)
## data.names <- c("R", "P", "Q", "D")
## model <- sde.make.model(ModelFile = ModelFile,
##                         param.names = param.names,
##                         data.names = data.names)

# parameters of tests
test.params <- list(dT.max = .1, dT.pf = .001,
                    test.pf = TRUE)

# heston model drift and diffusion
drift.fun <- function(x, theta) {
  K <- 10
  if(!is.matrix(x)) x <- t(x)
  if(!is.matrix(theta)) theta <- t(theta)
  R <- x[,1]
  P <- x[,2]
  Q <- x[,3]
  D <- x[,4]
  gg <- exp(theta)
  cbind(gg[,3]*D - gg[,7]*R,
        2*gg[,6]*Q - gg[,8]*P + gg[,4]*R - gg[,5]*P*(P-1),
        gg[,2]*(K-D) - gg[,1]*D*Q - gg[,6]*Q + .5*gg[,5]*P*(P-1),
        gg[,2]*(K-D) - gg[,1]*D*Q)
}
diff.fun <- function(x, theta) {
  K <- 10
  if(!is.matrix(x)) x <- t(x)
  if(!is.matrix(theta)) theta <- t(theta)
  if(nrow(x) == 1) {
    x <- do.call(rbind, rep(list(x), nrow(theta)))
  }
  if(nrow(theta) == 1) {
    theta <- do.call(rbind, rep(list(theta), nrow(x)))
  }
  ans <- sapply(1:nrow(x), function(ii) {
    rr <- x[ii,1]
    pp <- x[ii,2]
    qq <- x[ii,3]
    dd <- x[ii,4]
    gg <- exp(theta[ii,])
    Bt <- matrix(0, 8, 4)
    Bt[3,1] <- sqrt(gg[3] * dd)
    Bt[7,1] <- sqrt(gg[7] * rr)
    Bt[4,2] <- sqrt(gg[4] * rr)
    Bt[5,2] <- -2 * sqrt(.5*gg[5] * pp*(pp-1))
    Bt[6,2] <- 2 * sqrt(gg[6] * qq)
    Bt[8,2] <- - sqrt(gg[8] * pp)
    Bt[1,3] <- - sqrt(gg[1] * qq*dd)
    Bt[2,3] <- sqrt(gg[2] * (K-dd))
    Bt[5,3] <- sqrt(.5*gg[5] * pp*(pp-1))
    Bt[6,3] <- - sqrt(gg[6] * qq)
    Bt[1,4] <- - sqrt(gg[1] * qq*dd)
    Bt[2,4] <- sqrt(gg[2] * (K-dd))
    crossprod(Bt)
  })
  t(apply(ans, 2, function(x) chol(matrix(x,4,4))))
}
# generate heston data/parameters
randx <- function(nreps) {
  X0 <- c(R = 5, P = 12, Q = 8, D = 4) # rounding of stationary SDE distribution
  if(nreps > 1) X0 <- apply(t(replicate(nreps, X0)), 2, jitter)
  X0
}
randt <- function(nreps) {
  # from golightly & wilkinson (2005)
  Theta <- setNames(log(c(.1, .7, .35, .2, .1, .9, .3, .1)),
                    paste0("theta", 1:8))
  if(nreps > 1) Theta <- apply(t(replicate(nreps, Theta)), 2, jitter)
  Theta
}
validx <- function(x, theta) {
  K <- 10
  eps <- .05
  all(x > 1+eps) && (x[4] < K-eps)
}

source("msde-test_debug.R", local = TRUE)

#--- scratch -------------------------------------------------------------------

## # simulate data to see stationary distribution

## x0 <- c(R = 5, P = 5, Q = 5, D = 5)
## theta0 <- setNames(log(c(.1, .7, .35, .2, .1, .9, .3, .1)),
##                     paste0("theta", 1:8))
## dt <- .1
## nobs <- 500

## Xt <- sde.sim(model, x0 = x0, theta = theta0, dt = dt, nobs = nobs,
##               dt.sim = dt/100, burn = nobs)$data

## colMeans(Xt)
