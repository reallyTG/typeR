#--- lotka-volterra model --------------------------------------------------

#library(msde)
context("lotka-volterra model -- sd scale (precompiled)")

# setup lotvol model
## ModelFile <- "hestModel.h"
## param.names <- c("alpha", "gamma", "beta", "sigma", "rho")
## data.names <- c("X", "Z")
## model <- sde.make.model(ModelFile = ModelFile,
##                         param.names = param.names,
##                         data.names = data.names)
model <- sde.examples(model = "lotvol")

# test parameters
test.params <- list(dT.max = 1, dT.pf = .1,
                    test.pf = TRUE)

# lotka-volterra model drift and diffusion
drift.fun <- function(x, theta) {
  if(!is.matrix(x)) x <- t(x)
  if(!is.matrix(theta)) theta <- t(theta)
  dr <- cbind(theta[,1]*x[,1] - theta[,2]*x[,1]*x[,2], # alpha * H - beta * H*L
              theta[,2]*x[,1]*x[,2] - theta[,3]*x[,2]) # beta * H*L - gamma * L
  dr
}
diff.fun <- function(x, theta) {
  if(!is.matrix(x)) x <- t(x)
  if(!is.matrix(theta)) theta <- t(theta)
  df <- matrix(NA, nrow(x), 4)
  df[,1] <- theta[,1]*x[,1] + theta[,2]*x[,1]*x[,2] # alpha * H + beta * H*L
  df[,2] <- -theta[,2]*x[,1]*x[,2] # -beta * H*L
  df[,3] <- df[,2] # -beta * H*L
  df[,4] <- theta[,2]*x[,1]*x[,2] + theta[,3]*x[,2] # beta * H*L + gamma * L
  t(apply(df, 1,
          function(xx) chol(matrix(xx,2,2)))) # always use sd scale in R
}
# generate heston data/parameters
randx <- function(nreps) {
  X0 <- c(H = 71, L = 79)
  if(nreps > 1) X0 <- apply(t(replicate(nreps, X0)), 2, jitter)
  X0
}
randt <- function(nreps) {
  Theta <- c(alpha = .5, beta = .01, gamma = .3)
  if(nreps > 1) Theta <- apply(t(replicate(nreps, Theta)), 2, jitter)
  Theta
}
validx <- function(x, theta) {
  all(x > 0)
}

source("msde-test_debug.R", local = TRUE)
