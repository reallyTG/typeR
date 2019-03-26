context('step.spind working')


test_that("Outputs are as expected for GEE",{
  skip_on_cran()
  library(MASS)
  data(birthwt)
  x <- rep(1:14, 14)
  y <- as.integer(gl(14,14))
  coords <- cbind(x[-(190:196)],y[-(190:196)])
  formula <- formula(low ~ age + lwt + race + smoke + ftv + bwt)

  mgee <- GEE(formula, family = "gaussian", data = birthwt,
              coord = coords, corstr = "fixed", scale.fix = TRUE)

  ss<-step.spind(mgee, birthwt, trace = F)

  expect_true(is.list(ss))
  expect_is(ss$model,'formula')
  expect_equal(ss$model, as.formula(low ~ bwt))
  expect_equal(ss$table$QIC[1], 110.9656,
               tolerance = 1e-5)
  expect_equal(ss$table$Quasi.Lik[1], -52.86072,
               tolerance = 1e-5)

})

test_that("Outputs are as expected for WRM", {
  skip_on_cran()
  library(MASS)
  data(birthwt)
  x <- rep(1:14, 14)
  y <- as.integer(gl(14,14))
  coords <- cbind(x[-(190:196)],y[-(190:196)])
  formula <- formula(low ~ age + lwt + race + smoke + ftv + bwt)

  mgee <- WRM(formula, family = "gaussian", data = birthwt,
              coord = coords, plot = F)

  ss<-step.spind(mgee, birthwt, trace = F)

  expect_true(is.list(ss))
  expect_is(ss$model, 'formula')
  expect_equal(ss$model, as.formula(low ~ bwt))
  expect_equal(ss$table$LogLik[1], -36.00167,
               tolerance = 1e-6)
  expect_equal(ss$table$AIC, c(78.00334, 188.52268),
               tolerance = 1e-6)
  expect_equal(ss$table$AICc, c(78.13307, 188.58719),
               tolerance = 1e-6)

})

test_that("Trace outputs are as expected",{
  skip_on_cran()
  library(MASS)
  data(birthwt)
  x <- rep(1:14, 14)
  y <- as.integer(gl(14,14))
  coords <- cbind(x[-(190:196)],y[-(190:196)])
  formula <- formula(low ~ age + lwt + race + smoke + ftv + bwt + I(race^2))

  mgee <- GEE(formula, family = "gaussian", data = birthwt,
              coord = coords, corstr = "fixed", scale.fix = TRUE)

  expect_output(step.spind(mgee, birthwt, trace = FALSE),
                regexp = "-----\nModel hierarchy violated by last removal\n",
                " New Deleted Term: ")
})

test_that("Nothing breaks when first model is best model",{
  skip_on_cran()
  library(MASS)
  data(birthwt)
  x <- rep(1:14, 14)
  y <- as.integer(gl(14,14))
  coords <- cbind(x[-(190:196)],y[-(190:196)])
  formula <- formula(low ~ bwt)

  mgee <- GEE(formula, family = "gaussian", data = birthwt,
              coord = coords, corstr = "fixed", scale.fix = TRUE)

  ss <- step.spind(mgee, birthwt)
  expect_true(ss$model == as.formula(low ~ bwt))
  expect_equal(as.numeric(ss$table[1, 2:3]), c(-52.86072, 110.96558),
               tolerance = 1e-6)

})

