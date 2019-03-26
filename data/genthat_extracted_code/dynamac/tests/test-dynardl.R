context("test-dynardl")

test_that("Correct number of parameters estimated: intercept", {
  dyn.out.1 <- dynardl(concern ~ incshare10 + urate, data = ineq, 
    lags = list("concern" = 1, "incshare10" = 1, "urate" = 1), ec = TRUE,
    simulate = FALSE)
  expect_equal(length(coef(dyn.out.1$model)), 4)
})

test_that("Correct number of parameters estimated: no intercept", {
  dyn.out.2 <- dynardl(concern ~ incshare10 + urate, data = ineq, 
    lags = list("concern" = 1, "incshare10" = 1, "urate" = 1), ec = TRUE,
    simulate = FALSE, constant = FALSE)
  expect_equal(length(coef(dyn.out.2$model)), 3)
})


test_that("Correct number of parameters estimated: multiple lags", {
  dyn.out.3 <- dynardl(concern ~ incshare10 + urate, data = ineq, 
    lags = list("concern" = c(1, 2, 3), "incshare10" = 1, "urate" = 1), ec = TRUE,
    simulate = FALSE)
  expect_equal(length(coef(dyn.out.3$model)), 6)
})


test_that("Correct length of simulation: default burnin", {
  dyn.out.4 <- dynardl(concern ~ incshare10 + urate, data = ineq, 
    lags = list("concern" = c(1, 2, 3), "incshare10" = 1, "urate" = 1), ec = TRUE,
    shockvar = "urate", simulate = TRUE, range = 30)
  expect_equal(length(dyn.out.4$simulation$central), 30)
})


test_that("Correct length of simulation: custom burnin", {
  dyn.out.5 <- dynardl(concern ~ incshare10 + urate, data = ineq, 
    lags = list("concern" = c(1, 2, 3), "incshare10" = 1, "urate" = 1), ec = TRUE,
    shockvar = "urate", simulate = TRUE, burnin = 20, range = 30)
  expect_equal(length(dyn.out.5$simulation$central), 30)
})


test_that("Correct number of bounds for custom significance levels", {
  dyn.out.6 <- dynardl(concern ~ incshare10 + urate, data = ineq, 
    lags = list("concern" = c(1, 2, 3), "incshare10" = 1, "urate" = 1), ec = TRUE,
    shockvar = "urate", simulate = TRUE, burnin = 20, range = 30, sig = 80)
  expect_equal(ncol(dyn.out.6$simulation), 11)
})



