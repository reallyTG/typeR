
context("Checking meta-analysis example: Berkey (1995) Tuberclosis dataset")
suppressPackageStartupMessages(library(rstan))

## Fitting a binomial-normal hierachical model with Smith parametrization
test_that("Results are correct for fitting binomial normal hierarchical model (Smith model) using WIP priors.", {
  skip_on_cran()

  set.seed(23344)
  ## Load the dataset
  data('dat.Berkey1995', package = "MetaStan")
  ## Fitting a Binomial-Normal Hierarchial model using WIP priors
  bnhm.wip.bnhm1.stan  <- meta_stan(ntrt = dat.Berkey1995$nt,
                              nctrl = dat.Berkey1995$nc,
                              rtrt = dat.Berkey1995$rt,
                              rctrl = dat.Berkey1995$rc,
                              model = "BNHM1",
                              mu_prior = c(0, 10),
                              delta = 250,
                              tau_prior = 0.5,
                              tau_prior_dist = "half-normal")
  ### compare with results
  results = bnhm.wip.bnhm1.stan$fit_sum

  expect_equivalent(round(results['theta', '50%'], 2), -0.75, tolerance = 0.1)

})


## Fitting a binomial-normal hierachical model with Smith parametrization
test_that("Results are correct for fitting Fixed effect (Binomial likelhood) using WIP priors.", {
  skip_on_cran()

  set.seed(23344)
  ## Load the dataset
  data('dat.Berkey1995', package = "MetaStan")
  ## Fitting a Binomial-Normal Hierarchial model using WIP priors
  fe.stan  <- meta_stan(ntrt = dat.Berkey1995$nt,
                                    nctrl = dat.Berkey1995$nc,
                                    rtrt = dat.Berkey1995$rt,
                                    rctrl = dat.Berkey1995$rc,
                                    model = "FE",
                                    mu_prior = c(0, 10),
                                    delta = 250)
  ### compare with results
  results = fe.stan$fit_sum

  expect_equivalent(round(results['theta', '50%'], 2), -0.48, tolerance = 0.1)

})

## Fitting a binomial-normal hierachical model with "Higgins and Simmonds" parametrization
test_that("Results are correct for fitting binomial normal hierarchical model (Higgins and Simmonds) using WIP priors.", {
  skip_on_cran()

  set.seed(212244)
  ## Load the dataset
  data('dat.Berkey1995', package = "MetaStan")
  ## Fitting a Binomial-Normal Hierarchial model using WIP priors
  bnhm.wip.bnhm2.stan  <- meta_stan(ntrt = dat.Berkey1995$nt,
                              nctrl = dat.Berkey1995$nc,
                              rtrt = dat.Berkey1995$rt,
                              rctrl = dat.Berkey1995$rc,
                              model = "BNHM2",
                              mu_prior = c(0, 10),
                              delta = 250,
                              tau_prior = 0.5,
                              tau_prior_dist = "half-normal")
  ### compare with results
  results = bnhm.wip.bnhm2.stan$fit_sum

  expect_equivalent(round(results['tau', '50%'], 2), 0.59, tolerance = 0.1)

})

## Fitting a beta-binomial model from Kuss (2014)
test_that("Results are correct for fitting beta-binomial model using vague priors.", {
  skip_on_cran()

  set.seed(23344)
  ## Load the dataset
  data('dat.Berkey1995', package = "MetaStan")
  ## Fitting a Binomial-Normal Hierarchial model using WIP priors
  bnhm.wip.bbm.stan  <- meta_stan(ntrt = dat.Berkey1995$nt,
                                    nctrl = dat.Berkey1995$nc,
                                    rtrt = dat.Berkey1995$rt,
                                    rctrl = dat.Berkey1995$rc,
                                    model = "Beta-binomial")
  ### compare with results
  results = bnhm.wip.bbm.stan$fit_sum

  expect_equivalent(round(results['theta', '50%'], 2), -0.31, tolerance = 0.1)

})

