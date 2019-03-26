set.seed(123)
x <- runif(10, 1, 5)

test_that("SAVF_score provides proper messages and warnings", {

  expect_that(SAVF_score(x, x_low = 5, x_high = 1, rho = .653), throws_error())
  expect_that(SAVF_score(x, x_low = 1, x_high = 5, rho = c(.653, .5)), throws_error())

})

test_that("SAVF_score has correct dimensions and output type", {

  expect_equal(SAVF_score(x, x_low = 1, x_high = 5, rho = .653) %>% length(), 10)
  expect_true(SAVF_score(x, x_low = 1, x_high = 5, rho = .653) %>% is.numeric())
  expect_true(SAVF_score(x, x_low = 1, x_high = 5, rho = .653) %>% is.atomic())

})

test_that("SAVF_score computes correctly", {

  expect_equal(SAVF_score(x, x_low = 1, x_high = 5, rho = .653) %>% round(2) %>% .[[1]], 0.57)
  expect_equal(SAVF_score(x, x_low = 2, x_high = 4, rho = .75) %>% round(2) %>% .[[1]], 0.14)

})
