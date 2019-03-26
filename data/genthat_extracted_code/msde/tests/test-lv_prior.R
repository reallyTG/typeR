#library(msde)

context("lotka-volterra model -- custom prior")

# random matrix of size nreps x length(x) from vector x
jit.vec <- function(x, nreps) {
  apply(t(replicate(n = nreps, expr = x, simplify = "matrix")), 2, jitter)
}
# maximum absolute and relative error between two arrays
max.diff <- function(x1, x2) {
  c(abs = max(abs(x1-x2)), rel = max(abs(x1-x2)/max(abs(x1), 1e-8)))
}
# input check
lvcheck <- function(hyper, param.names, data.names) {
  if(is.null(names(hyper)) ||
     !identical(sort(names(hyper)), c("mu", "sigma"))) {
    stop("hyper must be a list with elements mu and sigma.")
  }
  mu <- hyper$mu
  if(length(mu) == 1) mu <- rep(mu, 4)
  if(!is.numeric(mu) || length(mu) != 4) {
    stop("mu must be a numeric scalar or vector of length four.")
  }
  sig <- hyper$sigma
  if(length(sig) == 1) sig <- rep(sig, 4)
  if(!is.numeric(sig) || length(sig) != 4 || !all(sig > 0)) {
    stop("sigma must be a positive scalar or vector of length four.")
  }
  list(mu, sig)
}

data.names <- c("H", "L")
param.names <- c("alpha", "beta", "gamma")
lvmod <- sde.make.model(ModelFile = "lotvolModel.h",
                        PriorFile = "lotvolPrior.h", # prior specification
                        hyper.check = lvcheck, # prior input checking
                        data.names = data.names,
                        param.names = param.names)


# generate some test values
nreta <- 12
x0 <- c(H = 71, L = 79)
theta0 <- c(alpha = .5, beta = .0025, gamma = .3)
nrphi <- 30

# prior check
test_that("lpi.R == lpi.cpp", {
for(ii in 1:nrphi) {
  X <- jit.vec(x0, nreta)
  Theta <- jit.vec(theta0, nreta)
  Eta <- cbind(Theta, L = X[,"L"])
  Phi <- list(mu = rnorm(4), sigma = rexp(4))
  # R version
  lpi.R <- colSums(dlnorm(x =  t(Eta),
                          meanlog = Phi$mu,
                          sdlog = Phi$sigma, log = TRUE))
  lpi.cpp <- sde.prior(model = lvmod, theta = Theta, x = X,
                       hyper = Phi)
  expect_equal(lpi.R, lpi.cpp)
}
})
