context("Parameteric Bootstrap Sampling")

set.seed(1234)
n <- 10
p <- 30
Niter <-  10
group <- rep(1:(p/10), each = 10)
Weights <- rep(1, p/10)
X <- matrix(rnorm(n*p), n)
Y <- X%*%rep(1,p) + rnorm(n)

test_that("lasso", {
  expect_error(PBsampler(X=X, PE_1=rep(0,p),sig2_1=1, lbd_1 = .5,
                         weights=rep(1,p), group=1:p, niter=10, type="lasso",
                         PEtype="coeff", parallel=TRUE), NA)
})


test_that("PE length under two types, \"mu\" and \"coeff\"", {
  expect_error(PBsampler(X = X, PE_1 = rep(0, p-1), sig2_1 = 1, lbd_1 = .5,
                         weights = Weights, group = group, niter = Niter,
                         type = "grlasso", PEtype = "coeff", parallel = FALSE),
               "PE must have a same length")
  expect_error(PBsampler(X = X, PE_1 = rep(0, p), sig2_1 = 1, lbd_1 = .5,
                         weights = Weights, group = group, niter = Niter,
                         type = "grlasso", PEtype = "coeff", parallel = FALSE)
               , NA)
  expect_error(PBsampler(X = X, PE_1 = rep(0, p), sig2_1 = 1, lbd_1 = 1,
                         weights = Weights, group = group, niter = Niter,
                         type = "sgrlasso", PEtype = "coeff", parallel = FALSE)
               , NA)
  expect_error(PBsampler(X = X, PE_1 = rep(0, p), sig2_1 = 1, lbd_1 = 1,
                         niter = Niter, type = "slasso", PEtype = "coeff",
                         parallel = FALSE)
               , NA)
  expect_error(PBsampler(X = X, PE_1 = rep(0, n-1), sig2_1 = 1, lbd_1 = .5,
                         weights = Weights, group = group, niter = Niter,
                         type = "grlasso", PEtype = "mu", parallel = FALSE),
               "PE must have a same length")
  expect_error(PBsampler(X = X, PE_1 = rep(0, n), sig2_1 = 1, lbd_1 = .5,
                         weights = Weights, group = group, niter = Niter,
                         type = "grlasso", PEtype = "mu", parallel = FALSE)
               , NA)
  expect_error(PBsampler(X = X, PE_1 = rep(0, n), sig2_1 = 1, lbd_1 = .5,
                         PE_2 = rep(0, n), sig2_2 = 1, lbd_2 = .5,
                         weights = Weights, group = group, niter = Niter,
                         type = "grlasso", PEtype = "mu", parallel = FALSE)
               , NA)
})

test_that("missing parameter", {
  expect_error(PBsampler(X = X, PE_1 = rep(0, p), sig2_1 = 1,
                         weights = Weights, group = group, niter = Niter,
                         type = "grlasso", PEtype = "coeff", parallel = FALSE)
               , "provide all the parameters")
  expect_error(PBsampler(X = X, PE_1 = rep(0, n), sig2_1 = 1, lbd_1 = .5,
                         PE_2 = rep(0, n), sig2_2 = 1,
                         weights = Weights, group = group, niter = Niter,
                         type = "grlasso", PEtype = "mu", parallel = FALSE)
               , "provide all the parameters")
})

test_that("Improper value of parameter, sig2/lbd/weights", {
  expect_error(PBsampler(X = X, PE_1 = rep(0, p), sig2_1 = -1, lbd_1 = .5,
                         weights = Weights, group = group, niter = Niter,
                         type = "grlasso", parallel = FALSE),
               "sig2 should be positive")
  expect_error(PBsampler(X = X, PE_1 = rep(0, p), sig2_1 = 1, lbd_1 = -1,
                         weights = Weights, group = group, niter = Niter,
                         type = "grlasso", parallel = FALSE),
               "lbd should be non-negative")
  expect_error(PBsampler(X = X, PE_1 = rep(0, p), sig2_1 = c(1,2), lbd_1 = .5,
                         weights = Weights, group = group, niter = Niter,
                         type = "grlasso", parallel = FALSE),
               "sig2/lbd should be a scalar")
  expect_error(PBsampler(X = X, PE_1 = rep(0, p), sig2_1 = 1, lbd_1 = .5,
                         weights = c(-1, rep(1, p / 10 - 1)), group = group,
                         niter = Niter, type = "grlasso", parallel = FALSE),
               "weights should be positive")
})

test_that("group argument",{
  Group <- rep(1:(p/10), each = 10); Weights <- rep(1, p/10)
  Group1 <- rep(1,p); Weights1 <- 1   # valid
  Group2 <- rep(1,p-1); Weights2 <- 1 # length(group) != p
  Group3 <- rep(c(1,2,4),each=10); Weights3 <- rep(1, 3) # group index are not consecutive integers
  Group4 <- rep(-1,p); Weights4 <- 1  # using negative integer
  expect_error(PBsampler(X = X, PE_1 = rep(0, p), sig2_1 = 1, lbd_1 = .5,
                         weights = Weights, group = Group, niter = Niter,
                         type = "grlasso", PEtype = "coeff", parallel = FALSE)
               , NA)
  expect_error(PBsampler(X = X, PE_1 = rep(0, p), sig2_1 = 1, lbd_1 = .5,
                         weights = Weights1, group = Group1, niter = Niter,
                         type = "grlasso", PEtype = "coeff", parallel = FALSE)
               , NA)
  expect_error(PBsampler(X = X, PE_1 = rep(0, p), sig2_1 = 1, lbd_1 = .5,
                         weights = Weights2, group = Group2, niter = Niter,
                         type = "grlasso", PEtype = "coeff", parallel = FALSE)
               , "group must have a same length with the number of X columns")
  expect_error(PBsampler(X = X, PE_1 = rep(0, p), sig2_1 = 1, lbd_1 = .5,
                         weights = Weights3, group = Group3, niter = Niter,
                         type = "grlasso", PEtype = "coeff", parallel = FALSE)
               , "group index has to be a consecutive integer starting from 1"
  )
  expect_error(PBsampler(X = X, PE_1 = rep(0, p), sig2_1 = 1, lbd_1 = .5,
                         weights = Weights4, group = Group4, niter = Niter,
                         type = "grlasso", PEtype = "coeff", parallel = FALSE)
               , "group index has to be a consecutive integer starting from 1"
  )
})

set.seed(1234)
n <- 40
p <- 50
Niter <-  10
group <- rep(1:(p/10), each = 10)
weights <- rep(1, p/10)
parallel <- (.Platform$OS.type != "windows")
X <- matrix(rnorm(n*p), n)
Y <- X %*% c(rep(1,5),rep(0,p-5)) + rnorm(n)

test_that("confidence interval", {
  object <- PBsampler(X = X,PE_1 = c(1,1,rep(0,p-2)),sig2_1 = 1,lbd_1 = .5,
                      weights = rep(1,p), group = 1:p, niter = 100,type="lasso",
                      PEtype = "coeff", parallel=parallel)
  expect_error(PB.CI(object = object, alpha = .05, method = "debias",
                     parallel=parallel)
               , NA)
  expect_error(PB.CI(object = object, alpha = .05, method = "none",
                     parallel=parallel)
               , NA)
  object <- PBsampler(X = X,PE_1 = c(1,1,rep(0,p-2)),sig2_1 = 1,lbd_1 = 1,
                      niter=100,type="slasso",parallel=parallel)
  expect_error(PB.CI(object = object, alpha = .05, method = "debias",
                     parallel=parallel)
               , NA)
  expect_error(PB.CI(object = object, alpha = .05, method = "none")
               , NA)
  object <- PBsampler(X = X,PE_1 = c(1,1,rep(0,p-2)),sig2_1 = 1,lbd_1 = .5,
                      group=group,niter=100,type="grlasso",parallel=parallel)
  expect_error(PB.CI(object = object, alpha = .05, method = "debias",
                     parallel=parallel)
               , NA)
  expect_error(PB.CI(object = object, alpha = .05, method = "none")
               , NA)
  object <- PBsampler(X = X,PE_1 = c(1,1,rep(0,p-2)),sig2_1 = 1,lbd_1 = 1,
                      group=group,niter=100,type="sgrlasso",parallel=parallel)
  expect_error(PB.CI(object = object, alpha = .05, method = "debias",
                     parallel=parallel)
               , NA)
  expect_error(PB.CI(object = object, alpha = .05, method = "none")
               , NA)
})

if(.Platform$OS.type != "windows"){
  test_that("parallel", {
    expect_warning(PBsampler(X = X, PE_1 = rep(0, p), sig2_1 = 1, lbd_1 = .5,
                             weights = weights, group = group, niter = Niter,
                             type = "grlasso", PEtype = "coeff", parallel = TRUE,
                             ncores = 1)
                   , "set ncores to 2")
    # expect_warning(PBsampler(X = X, PE_1 = rep(0, p), sig2_1 = 1, lbd_1 = .5,
    #                              weights = Weights, group = group, niter = Niter, PEtype = "coeff", parallel = TRUE,
    #                              ncores = 100000)
    #                , "maximum possible value")
    expect_warning(PBsampler(X = X, PE_1 = rep(0, p), sig2_1 = 1, lbd_1 = .5,
                             weights = weights, group = group, niter = Niter,
                             type = "grlasso", PEtype = "coeff", parallel = TRUE,
                             ncores = 2)
                   , NA)
  })
} else {
  test_that("parallel", {
    expect_warning(PBsampler(X = X, PE_1 = rep(0, p), sig2_1 = 1, lbd_1 = .5,
                             weights = weights, group = group, niter = Niter,
                             type = "grlasso", PEtype = "coeff", parallel = TRUE,
                             ncores = 1)
                   , "Under Windows platform")
    # expect_warning(PBsampler(X = X, PE_1 = rep(0, p), sig2_1 = 1, lbd_1 = .5,
    #                              weights = Weights, group = group, niter = Niter, PEtype = "coeff", parallel = TRUE,
    #                              ncores = 100000)
    #                , "maximum possible value")
    expect_warning(PBsampler(X = X, PE_1 = rep(0, p), sig2_1 = 1, lbd_1 = .5,
                             weights = weights, group = group, niter = Niter,
                             type = "grlasso", PEtype = "coeff", parallel = TRUE,
                             ncores = 2)
                   , "Under Windows platform")
  })
}



