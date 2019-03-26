context("Sub-optimal System-GMM estimator")

data(EmplUK, package = "plm")
EmplUK <- dplyr::filter(EmplUK, year %in% c(1978, 1979, 1980, 1981, 1982)) %>%
  dplyr::select(emp) %>%
  unclass()
EmplUK <- matrix(EmplUK[[1]], nrow = 5, ncol = 140, byrow = FALSE)

test_that("onestep ssys_gmm estimator works", {
  model <- ssys_gmm(EmplUK, "onestep")

  expect_true(is.numeric(model))
  expect_equal(length(model), 1)
})

test_that("twosteps ssys_gmm estimator works", {
  model <- ssys_gmm(EmplUK, "twosteps")

  expect_true(is.numeric(model))
  expect_equal(length(model), 1)
})

test_that("threesteps ssys_gmm estimator works", {
  model <- ssys_gmm(EmplUK, "threesteps")

  expect_true(is.numeric(model))
  expect_equal(length(model), 1)
})
