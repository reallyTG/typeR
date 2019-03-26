
context("Importance Sampling")

set.seed(1234)
n <- 10
p <- 5
Niter <-  10
Group <- rep(1:p)
Weights <- rep(1, p)
x <- matrix(rnorm(n*p), n)

# Target distribution parameter
PETarget <- rep(0,p)
sig2Target <- .5
lbdTarget <- .37

# Proposal distribution parameter
PEProp1 <- rep(0, p) ;PEProp2 <- rep(1, p)
sig2Prop1 <- .5; sig2Prop2 <- 1
lbdProp1 <- .37; lbdProp2 <- .5

PB <- PBsampler(X = x, PE_1 = rep(1, p), sig2_1 = 1, lbd_1 = .5,
 weights = Weights, group = Group, niter = Niter, type = "lasso", PEtype = "coeff", parallel = FALSE)

test_that("Low dimensional setting", {
  expect_error(hdIS(PBsample = PB,PETarget = rep(0,p), sig2Target = .5, lbdTarget = .37,
                    log = TRUE)
  , "High dimensional setting")
})

class(PB) <- "list"

test_that("Wrong class", {
  expect_error(hdIS(PBsample = PB,PETarget = rep(0,p), sig2Target = .5, lbdTarget = .37,
                    log = TRUE)
               , "Use EAlasso::PBsampler")
})


set.seed(1234)
n <- 10
p <- 30
Niter <-  10
Group1 <- rep(1:(p/10), each = 10)
Weights1 <- rep(1, p/10)
Group2 <- 1:p
Weights2 <- rep(1, p)

x <- matrix(rnorm(n*p), n)

PBMixture1 <- PBsampler(X = x, PE_1 = rep(0, p), sig2_1 = 1, lbd_1 = .5,
              PE_2 = rep(1, p), sig2_2 = 2, lbd_2 = .3, weights = Weights1,
              group = Group1, type = "grlasso", PEtype = "coeff", niter = Niter, parallel = FALSE)
PBMixture2 <- PBsampler(X = x, PE_1 = rep(0, p), sig2_1 = 1, lbd_1 = .5,
                       PE_2 = rep(1, p), sig2_2 = 2, lbd_2 = .3, weights = Weights2,
                       group = Group2, type = "lasso", PEtype = "coeff", niter = Niter, parallel = FALSE)
PBMixture3 <- PBsampler(X = x, PE_1 = rep(0, p), sig2_1 = 1, lbd_1 = 1,
                        PE_2 = rep(1, p), sig2_2 = 2, lbd_2 = 2, weights = Weights1,
                        group = Group1, type = "sgrlasso", PEtype = "coeff", niter = Niter, parallel = FALSE)
PBMixture4 <- PBsampler(X = x, PE_1 = rep(0, p), sig2_1 = 1, lbd_1 = 1,
                        PE_2 = rep(1, p), sig2_2 = 2, lbd_2 = 2, weights = Weights2,
                        group = Group2, type = "slasso", PEtype = "coeff", niter = Niter, parallel = FALSE)

test_that("Mixture under four types", {
  expect_error(hdIS(PBsample = PBMixture1, PETarget = rep(0,p),
    sig2Target = .5, lbdTarget = .37, log = TRUE), NA)
  expect_error(hdIS(PBsample = PBMixture2, PETarget = rep(0,p),
                    sig2Target = .5, lbdTarget = .37, log = TRUE), NA)
  expect_error(hdIS(PBsample = PBMixture3, PETarget = rep(0,p),
                    sig2Target = .5, lbdTarget = .37, log = TRUE), NA)
  expect_error(hdIS(PBsample = PBMixture4, PETarget = rep(0,p),
                    sig2Target = .5, lbdTarget = .37, log = TRUE), NA)
})
