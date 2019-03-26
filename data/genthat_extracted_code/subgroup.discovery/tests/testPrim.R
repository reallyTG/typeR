library(subgroup.discovery)
context("Patient Rule Induction Method")

testthat::test_that("Test covering functionality on pima data set", {

  data(pima)

  X <- pima[,-9]
  y <- pima$class

  p.cov <- subgroup.discovery::prim.cover(X = X, y = y, peeling.quantile = 0.05, min.support = 0.1)

  p.validate <- p.cov$covers[[1]]
  p.leftover <- p.cov$leftover

  expect_is(p.cov, "prim.cover")
  expect_is(p.validate, "prim.validate")
  expect_is(p.leftover, "prim.cover.leftover")

  #expect_true(!is.unsorted(rev(sapply(p.cov$covers, function(x) x$cov.support))))

})

testthat::test_that("Test covering functionality on the pima data set, using the formula interface", {

  data(pima)

  p.cov <- subgroup.discovery::prim.cover(class ~ ., data = pima, peeling.quantile = 0.05, min.support = 0.1)

  p.validate <- p.cov$covers[[1]]
  p.leftover <- p.cov$leftover

  expect_is(p.cov, "prim.cover")
  expect_is(p.validate, "prim.validate")
  expect_is(p.leftover, "prim.cover.leftover")

  expect_is(p.cov$formula, "formula")
  expect_identical(p.cov$formula, as.formula(class ~ .))

  #expect_true(!is.unsorted(rev(sapply(p.cov$covers, function(x) x$cov.support))))

})
