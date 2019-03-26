context("abc_smc_nltt")

test_that("abc_smc_nltt use", {
  # These tests are very long
  if (Sys.getenv("HOME") == "/home/richel" ||
   Sys.getenv("HOME") == "/home/p230198") return()
  print(Sys.getenv("HOME"))

  treesim <- function(params) {
    t <- TESS::tess.sim.taxa(n = 1,
                             lambda = params[1],
                             mu = 0.0, nTaxa = 100, max = 10)[[1]]
    return(t)
  }

  prior_gen <- function() {
    return(rexp(n = 1, rate = 10))
  }

  prior_dens <- function(val) {
   return(dexp(val[1], rate = 10))
  }

  set.seed(42)
  obs <- treesim(c(0.50, 0))

  LL_BD <- function(params, phy) {
    lnl <- TESS::tess.likelihood(ape::branching.times(phy),
                                 lambda = params[1], mu = 0.0,
                                 samplingProbability = 1, log = TRUE)
    prior1  <- log(prior_dens(params))
    return(lnl + prior1)
  }

  tofit <- function(params) {
    if (params[1] <= 0) return(1e6)
    if (params[1] > 100) return(1e6)
    return(-1 * LL_BD(params, obs))
  }

  ML <- stats::optimize(f = tofit, interval = c(0, 1))

  statwrapper <- function(tree1) {
    return(nLTTstat_exact(tree1, obs, "abs")) # nolint nLTTstat has uppercase due to backwards compatibility
  }

  A <- abc_smc_nltt(
    obs, c(statwrapper), treesim, init_epsilon_values = 0.2,
    prior_generating_function = prior_gen,
    prior_density_function = prior_dens,
    number_of_particles = 100, sigma = 0.05, stop_rate = 0.01)

  testthat::expect_equal(
    mean(A),
    ML$minimum[[1]],
    tolerance = 0.052
  )
})

test_that("abc_smc_nltt abuse", {

  treesim <- function(params) {
    t <- TESS::tess.sim.taxa(n = 1,
                             lambda = params[1],
                             mu = params[2], nTaxa = 1000, max = 100000)[[1]]
    return(t)
  }

  prior_gen <- function() {
    return(rexp(n = 2, rate = 1))
  }

  prior_dens <- function(val) {
    if (val[2] > val[1]) {
      return(-1)
    }
    return(dexp(val[1], rate = 1) *
               dexp(val[2], rate = 1))
  }

  statwrapper <- function(tree1) {
    return(nLTTstat(tree1, obs, "abs"))  # nolint nLTTstat has uppercase due to backwards compatibility
  }

  expect_error(
    abc_smc_nltt(
      42, c(statwrapper), treesim, init_epsilon_values = 0.1,
      prior_generating_function = prior_gen,
      prior_density_function = prior_dens,
      number_of_particles = 100, sigma = 1, stop_rate = 0.1),
    "abc_smc_nltt: tree must be of class 'phylo'"
  )

  obs <- treesim(c(1, 0))
  expect_error(
    abc_smc_nltt(obs, c(statwrapper), treesim, init_epsilon_values = -0.5,
      prior_generating_function = prior_gen,
      prior_density_function = prior_dens,
      number_of_particles = 100, sigma = 1, stop_rate = 0.1),
    "abc_smc_nltt: epsilon values have to be positive"
  )

  expect_error(
    abc_smc_nltt(obs, statwrapper, treesim, init_epsilon_values = -0.5,
                 prior_generating_function = prior_gen,
                 prior_density_function = prior_dens,
                 number_of_particles = 100, sigma = 1, stop_rate = 0.1),
    "abc_smc_nltt: the statistics function has to be given in vector style,"
  )
})
