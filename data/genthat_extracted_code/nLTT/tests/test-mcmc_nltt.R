context("mcmc_nltt")

test_that("mcmc_nltt use", {
  # These tests are very long
  if (Sys.getenv("HOME") == "/home/richel" ||
    Sys.getenv("HOME") == "/home/p230198") return()
  print(Sys.getenv("HOME"))

  set.seed(1)
  tree1 <- TESS::tess.sim.taxa(n = 1, nTaxa = 50,
                               max = 100, lambda = 1.0, mu = 0.0)[[1]]

  LL_BD <- function(params, phy) {
    lnl <- TESS::tess.likelihood(ape::branching.times(phy),
                                 lambda = params[1], mu = params[2],
                                 samplingProbability = 1, log = TRUE)
    prior1  <- dexp(params[1], rate = 10, log = TRUE)
    prior2  <- dexp(params[2], rate = 10, log = TRUE)
    return(lnl + prior1 + prior2)
  }

  tofit <- function(params) {
    if (params[1] <= 0) return(1e6)
    if (params[2] < 0) return(1e6)
    if (params[1] > 100) return(1e6)
    if (params[2] > 100) return(1e6)
    return(-1 * LL_BD(params, tree1))
  }

  ML <- optim(par = c(1, 0.001), fn = tofit)

  expect_equal(
    colMeans(mcmc_nltt(tree1, LL_BD, c(1, 0.001), c(TRUE, TRUE),
                        iterations = 10000, burnin = 1000,
                        thinning = 1, sigma = 1))[[1]],
    ML$par[[1]],
    tolerance = 0.05
  )

  expect_equal(
    colMeans(mcmc_nltt(tree1, LL_BD, c(1, 0.01), c(TRUE, TRUE),
                         iterations = 10000,
                         burnin = 1000, thinning = 1, sigma = 0.5))[[1]],
    colMeans(mcmc_nltt(tree1, LL_BD, c(1, 0.01), c(FALSE, FALSE),
                         iterations = 10000,
                         burnin = 1000, thinning = 1, sigma = 0.5))[[1]],
    tolerance = 0.05
  )
})

test_that("mcmc_nltt abuse", {
  set.seed(1) #just to be safe
  tree1 <- TESS::tess.sim.taxa(n = 1, nTaxa = 50,
                               max = 100, lambda = 1.0, mu = 0.0)[[1]]

  LL_BD <- function(params, phy) {
    lnl <- TESS::tess.likelihood(ape::branching.times(phy),
                                 lambda = params[1], mu = params[2],
                                 samplingProbability = 1, log = TRUE)
    prior1  <- dexp(params[1], rate = 10, log = TRUE)
    prior2  <- dexp(params[2], rate = 10, log = TRUE)
    return(lnl + prior1 + prior2)
  }

  expect_error(
    mcmc_nltt(tree1, LL_BD, c(1, 0.0), c(TRUE, TRUE),
               iterations = 10000, burnin = 1000, thinning = 1, sigma = 0.5),
    "Cannot propose new value for a parameter with value 0.0."
  )

  expect_error(
    mcmc_nltt(42, LL_BD, c(1, 0.01), c(TRUE, TRUE),
               iterations = 10000, burnin = 1000, thinning = 1, sigma = 0.5),
    "mcmc_nltt: phy must be of class 'phylo'"
  )

  expect_error(
    mcmc_nltt(tree1, LL_BD, c(1, -1), c(TRUE, TRUE),
               iterations = 10000, burnin = 1000, thinning = 1, sigma = 0.5),
    "mcmc_nltt: initial parameter values have to be above zero"
  )
})
