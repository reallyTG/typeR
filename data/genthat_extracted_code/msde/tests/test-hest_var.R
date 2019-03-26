#--- heston model on sd scale --------------------------------------------------

#library(msde)
context("heston model -- var scale")

# setup heston model
ModelFile <- "hestModel_var.h"
param.names <- c("alpha", "gamma", "beta", "sigma", "rho")
data.names <- c("X", "Z")
model <- sde.make.model(ModelFile = ModelFile,
                        param.names = param.names,
                        data.names = data.names)

# test parameters
test.params <- list(dT.max = 1, dT.pf = .1,
                    test.pf = TRUE)

# heston model drift and diffusion
drift.fun <- function(x, theta) {
  if(!is.matrix(x)) x <- t(x)
  if(!is.matrix(theta)) theta <- t(theta)
  cbind(theta[,1] - .125 * x[,2]^2, theta[,3]/x[,2] - .5*theta[,2]*x[,2])
}
diff.fun <- function(x, theta) {
  if(!is.matrix(x)) x <- t(x)
  if(!is.matrix(theta)) theta <- t(theta)
  cv <- .5*theta[,5]*theta[,4]*x[,2]
  ans <- cbind(.25 * x[,2]^2, cv, cv, theta[,4]^2)
  t(apply(ans, 1, function(x) chol(matrix(x,2,2))))
}
# generate heston data/parameters
randx <- function(nreps) {
  X0 <- c(X = log(1000), Z = 0.1)
  if(nreps > 1) X0 <- apply(t(replicate(nreps, X0)), 2, jitter)
  X0
}
randt <- function(nreps) {
  # adopt the parameter calibration from Bakshi et. al. (1997) with minor modification
  Theta <- c(alpha = 0.04, gamma = 1.15, beta = 0.3, sigma = 0.19, rho = -0.64)
  #Theta <- c(alpha = 0.1, gamma = 1, beta = 0.8, sigma = 0.6, rho = -0.8)
  if(nreps > 1) Theta <- apply(t(replicate(nreps, Theta)), 2, jitter)
  Theta
}
validx <- function(x, theta) x[2] > 0

source("msde-test_debug.R", local = TRUE)

