context("test-summary-manyglm.R")
test_that("gamma summary", {
  # generate a response matrix Xij ~ exp(1) distribution
  # ${nVar} cols
  # with one junk predictor from the normal distribution
  shape <- 1; rate <- 1; nVar <- 5; n <- 100
  SEED <- 1001
  FAMILY <- 'gamma'
  set.seed(SEED)
  Y2 <- mvabund(sapply(rep(1,nVar), function(rate) rgamma(n, shape, rate)))
  junk <- rnorm(n)
  mglmg <- manyglm(Y2 ~ junk, family=FAMILY)

  tests <- c('wald', 'score', 'LR')
  # resamp = c('case', 'perm.resid', 'montecarlo', 'pit.trap')
  summaries <- lapply(tests, function(t)
    summary(mglmg,
      test=t,
      rep.seed = TRUE))
  expect_equal_to_reference(summaries, 'gamma_summaries.rds')
})
