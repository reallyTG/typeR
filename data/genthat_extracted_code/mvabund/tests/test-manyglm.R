context("test-manyglm.R")
source('utils.R')

test_that("bad link function errors", {
  set.seed(100)
  data(spider)
  spiddat <- mvabund(spider$abund)
  X <- spider$x
  #To fit a log-linear model assuming counts are poisson:
  bad_fam <- "avdsfjhsd"
  expect_error(manyglm(spiddat~X, family=bad_fam),"'family'.*")
  expect_error(manyglm(spiddat~X, family=data.frame()),"'family'.*")
})

test_that("spider coefs", {
  data(spider)
  spiddat <- mvabund(spider$abund)
  X <- spider$x
  #To fit a log-linear model assuming counts are poisson:
  glm.spid <- manyglm(spiddat~X, family="poisson")
  expect_is(glm.spid, "manyglm")

  spider_coefs <- coef(glm.spid[1])
  expect_equal_to_reference(spider_coefs, 'spider_coefs.rds')
  expect_equal_to_reference(summary(glm.spid), 'poisson_spider_summary.rds')
})

test_that('theta estimation method warnings', {
  Y <- sapply(1:4, function(x)  rnbinom(30, 5, 0.4))
  Y <- mvabund(Y)
  # method of moments is not allowed for negative binomial family
  expect_error(manyglm(Y ~ 1, theta.method = 'MM'), 'theta.method.*')
})


test_that("gamma family shape parameter", {
  set.seed(100)
  n <- 1000; shapes <- 1:4; rate <- 1
  Y <- mvabund(sapply(shapes, function(shape) rgamma(n, shape, rate)))
  gamma_glm <- manyglm(Y ~ 1, family="gamma", show.warning = T)
  expect_true(all(signif(gamma_glm$theta, 5) == c(1.0034,2.0542,2.9994,4.0487)))
})


