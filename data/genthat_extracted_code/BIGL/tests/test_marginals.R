context("Monotherapy fitting")

test_that('marginals', {

  ## We expect both NLS methods to give similar results in nice cases. This is
  ## not always true for the method based on optim output, although in very nice
  ## cases all should be similar.

  ## Check that both methods lead to same results when no transformations
  ## are called.
  dataM <- data[data$d1 < 1e-12 | data$d2 < 1e-12,]

  fit1 <- fitMarginals(data, method = "nls")
  fit2 <- fitMarginals(data, method = "nlslm")
  fit3 <- fitMarginals(data, method = "optim")

  expect_true(inherits(fit1, "MarginalFit"))
  expect_true(inherits(fit2, "MarginalFit"))
  expect_true(inherits(fit3, "MarginalFit"))

  expect_equal(coef(fit1), coef(fit2))
  expect_equal(fitted(fit1), fitted(fit2))
  expect_equal(residuals(fit1), residuals(fit2))

  expect_equal(fitted(fit1), predict(fit1, newdata = dataM))
  expect_equal(fitted(fit2), predict(fit2, newdata = dataM))

  ## Give some leeway for this to pass
  expect_that(all(abs(vcov(fit1) - vcov(fit2)) < 1e-1),
              is_true())

  expect_equal(df.residual(fit1), df.residual(fit2))
  expect_equal(df.residual(fit1), df.residual(fit3))


  expect_equal(dataM[["effect"]], fitted(fit1) + residuals(fit1))
  expect_equal(dataM[["effect"]], fitted(fit2) + residuals(fit2))
  expect_equal(dataM[["effect"]], fitted(fit3) + residuals(fit3))

  expect_equal(fitMarginals(data, start = initPars, method = "nls")$coef,
               fitMarginals(data, start = initPars, method = "nlslm")$coef)

})

test_that('marginals-constraints', {

  constraintsA <- list("matrix" = c(0, 0, 0, 1, -1, 0, 0),
                       "vector" = 0)
  constraintsB <- list("matrix" = c(0, 0, 1, 0, 0, 0, 0),
                       "vector" = 13000)

  constraints2 <- list(
    "matrix" = rbind(c(0, 0, 1, 0, 0, 0, 0),
                     c(0, 0, 0, 1, -1, 0, 0)),
    "vector" = c(13000, 0)
  )

  constraints <- list(
    "matrix" = rbind(c(2, -2, 0, 0, 0, 0, 0),
                     c(0, 0, 0, 1, -1, 0, 0),
                     c(0, 0, 0, 0, 0, pi, -pi)),
    "vector" = rep(0, 3)
  )

  ## Constraining using `fixed` argument
  fit1 <- fitMarginals(data, method = "nls", fixed = c("b" = 13000, "h2" = 2))
  fit2 <- fitMarginals(data, method = "nlslm", fixed = c("h2" = 2, "b" = 13000))
  fit3 <- fitMarginals(data, method = "optim", fixed = c("b" = 13000, "h2" = 2))

  expect_equal(fit1$coef[["b"]], 13000)
  expect_equal(fit2$coef[["b"]], 13000)
  expect_equal(fit3$coef[["b"]], 13000)

  expect_equal(fit1$coef[["h2"]], 2)
  expect_equal(fit2$coef[["h2"]], 2)
  expect_equal(fit3$coef[["h2"]], 2)

  expect_error(fitMarginals(data, method = "optim", fixed = c("ABC" = 1)))
  expect_error(fitMarginals(data, method = "optim", fixed = c("b" = 13000, "ABC" = 1)))

  expect_warning(fit1 <- fitMarginals(data, method = "nlslm",
                                      fixed = c("b" = 12000, "h2" = 1.5),
                                      constraints = constraints2))
  expect_equal(fit1$coef[["b"]], 12000)
  expect_equal(fit1$coef[["h2"]], 1.5)


  ## Fitting with fixed baseline
  fit1 <- fitMarginals(data, method = "nls", constraints = constraintsB)
  fit2 <- fitMarginals(data, method = "nlslm", constraints = constraintsB)
  fit3 <- fitMarginals(data, method = "optim", constraints = constraintsB)

  expect_equal(fit1$coef[["b"]], 13000)
  expect_equal(fit2$coef[["b"]], 13000)
  expect_equal(fit3$coef[["b"]], 13000)

  expect_equal(length(coef(fit1)), 7)
  expect_equal(length(coef(fit2)), 7)
  expect_equal(length(coef(fit3)), 7)

  expect_that(all(abs(fit1$coef - fit2$coef) < 1e-4), is_true())

  ## Fitting with shared asymptote
  fit1 <- fitMarginals(data, method = "nls", constraints = constraintsA)
  fit2 <- fitMarginals(data, method = "nlslm", constraints = constraintsA)
  fit3 <- fitMarginals(data, method = "optim", constraints = constraintsA)

  expect_equal(fit1$coef[["m1"]], fit1$coef[["m2"]])
  expect_equal(fit2$coef[["m1"]], fit2$coef[["m2"]])
  expect_equal(fit3$coef[["m1"]], fit3$coef[["m2"]])

  expect_equal(length(coef(fit1)), 7)
  expect_equal(length(coef(fit2)), 7)
  expect_equal(length(coef(fit3)), 7)

  expect_that(all(abs(fit1$coef - fit2$coef) < 1e-4), is_true())

  ## Fitting with fixed baseline and shared asymptote
  fit1 <- fitMarginals(data, method = "nls", constraints = constraints2)
  fit2 <- fitMarginals(data, method = "nlslm", constraints = constraints2)
  fit3 <- fitMarginals(data, method = "optim", constraints = constraints2)

  expect_equal(fit1$coef[["m1"]], fit1$coef[["m2"]])
  expect_equal(fit2$coef[["m1"]], fit2$coef[["m2"]])
  expect_equal(fit3$coef[["m1"]], fit3$coef[["m2"]])
  expect_equal(fit1$coef[["b"]], 13000)
  expect_equal(fit2$coef[["b"]], 13000)
  expect_equal(fit3$coef[["b"]], 13000)

  expect_equal(length(coef(fit1)), 7)
  expect_equal(length(coef(fit2)), 7)
  expect_equal(length(coef(fit3)), 7)

  expect_that(all(abs(fit1$coef - fit2$coef) < 1e-4), is_true())

  fit1 <- fitMarginals(data, method = "nls", constraints = constraints)
  fit2 <- fitMarginals(data, method = "nlslm", constraints = constraints)
  fit3 <- fitMarginals(data, method = "optim", constraints = constraints)

  expect_equal(length(coef(fit1)), 7)
  expect_equal(length(coef(fit2)), 7)
  expect_equal(length(coef(fit3)), 7)

  expect_equal(fit1$coef[["h1"]], fit1$coef[["h2"]])
  expect_equal(fit2$coef[["h1"]], fit2$coef[["h2"]])
  expect_equal(fit3$coef[["h1"]], fit3$coef[["h2"]])

  expect_equal(fit1$coef[["m1"]], fit1$coef[["m2"]])
  expect_equal(fit2$coef[["m1"]], fit2$coef[["m2"]])
  expect_equal(fit3$coef[["m1"]], fit3$coef[["m2"]])

  expect_equal(fit1$coef[["e1"]], fit1$coef[["e2"]])
  expect_equal(fit2$coef[["e1"]], fit2$coef[["e2"]])
  expect_equal(fit3$coef[["e1"]], fit3$coef[["e2"]])

})

test_that('marginals-transforms', {
  ## Check that both methods lead to same results under transformations and with
  ## perturbed initial parameters.
  dataM <- data[data$d1 < 1e-12 | data$d2 < 1e-12,]

  fit1 <- fitMarginals(data, transforms = transforms, method = "nls")
  fit2 <- fitMarginals(data, transforms = transforms, method = "nlslm")
  fit3 <- fitMarginals(data, transforms = transforms, method = "optim")

  expect_equal(length(coef(fit1)), 7)
  expect_equal(length(coef(fit2)), 7)
  expect_equal(length(coef(fit3)), 7)

  expect_that(all(abs(fit1$coef - fit2$coef) < 1e-4), is_true())
  expect_that(all(abs(fitted(fit1) - fitted(fit2)) < 1e-4), is_true())
  expect_that(all(abs(residuals(fit1) - residuals(fit2)) < 1e-4), is_true())

  expect_equal(fitted(fit1), predict(fit1, newdata = dataM))
  expect_equal(fitted(fit2), predict(fit2, newdata = dataM))

  expect_that(all(abs(vcov(fit1) - vcov(fit2)) < 3e-2), is_true())

  expect_equal(df.residual(fit1), df.residual(fit2))
  expect_equal(df.residual(fit1), df.residual(fit3))

  expect_equal(transforms$PowerT(dataM[["effect"]], transforms$compositeArgs),
               fitted(fit1) + residuals(fit1))
  expect_equal(transforms$PowerT(dataM[["effect"]], transforms$compositeArgs),
               fitted(fit2) + residuals(fit2))
  expect_equal(transforms$PowerT(dataM[["effect"]], transforms$compositeArgs),
               fitted(fit3) + residuals(fit3))

  fit1 <- fitMarginals(data, start = initParsT,
                       transforms = transforms, method = "nls")
  fit2 <- fitMarginals(data, start = initParsT,
                       transforms = transforms, method = "nlslm")
  expect_that(all(abs(fit1$coef - fit2$coef) < 1e-4), is_true())


  constraints <- list(
    "matrix" = rbind(c(2, -2, 0, 0, 0, 0, 0),
                     c(0, 0, 0, 1, -1, 0, 0),
                     c(0, 0, 0, 0, 0, pi, -pi)),
    "vector" = rep(0, 3)
  )

  fit1 <- fitMarginals(data, method = "nls", constraints = constraints,
                       transforms = transforms)
  fit2 <- fitMarginals(data, method = "nlslm", constraints = constraints,
                       transforms = transforms)
  fit3 <- fitMarginals(data, method = "optim", constraints = constraints,
                       transforms = transforms)

  expect_equal(length(coef(fit1)), 7)
  expect_equal(length(coef(fit2)), 7)
  expect_equal(length(coef(fit3)), 7)

  expect_equal(fit1$coef[["h1"]], fit1$coef[["h2"]])
  expect_equal(fit2$coef[["h1"]], fit2$coef[["h2"]])
  expect_equal(fit3$coef[["h1"]], fit3$coef[["h2"]])

  expect_equal(fit1$coef[["m1"]], fit1$coef[["m2"]])
  expect_equal(fit2$coef[["m1"]], fit2$coef[["m2"]])
  expect_equal(fit3$coef[["m1"]], fit3$coef[["m2"]])

  expect_equal(fit1$coef[["e1"]], fit1$coef[["e2"]])
  expect_equal(fit2$coef[["e1"]], fit2$coef[["e2"]])
  expect_equal(fit3$coef[["e1"]], fit3$coef[["e2"]])


})

test_that('marginals-extraArgs', {
  ## Make sure extra arguments (lower, upper) are passed to the nls optimizers
  lowerBounds <- rep(0, 7)
  upperBounds <- c(1, rep(Inf, 6))
  
  fit1 <- fitMarginals(data, method = "nls", algorithm = "port", 
      lower = lowerBounds, upper = upperBounds)
  fit2 <- fitMarginals(data, method = "nlslm", 
      lower = lowerBounds, upper = upperBounds)
  
  expect_that(all(coef(fit1) >= 0), is_true())
  expect_that(all(coef(fit2) >= 0), is_true())
  
  expect_equal(coef(fit1)[[1]], 1)
  expect_equal(coef(fit2)[[1]], 1)
  
})