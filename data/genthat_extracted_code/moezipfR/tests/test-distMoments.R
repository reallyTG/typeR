context("Distribution Moments")

test_that("The alpha value have to be greater than the moment + 1.", {
  expect_that(moezipfR.moments(k = 2, alpha = 1.5, beta = 1.3), throws_error())
  expect_that(moezipfR.moments(k = 3, alpha = 2.5, beta = 1.3), throws_error())
})

test_that("All parameter values have to be numerical.", {
  expect_that(moezipfR.moments(k = '2', alpha = 2.5, beta = 1.3), throws_error())
  expect_that(moezipfR.moments(k = 3, alpha = '2.5', beta = 1.3), throws_error())
  expect_that(moezipfR.moments(k = 3, alpha = 4.5, beta = '1.3'), throws_error())
  expect_that(moezipfR.moments(k = 3, alpha = 4.5, beta = 1.3, tolerance = '1*10^-2'), throws_error())
})

test_that("The moment parameter have to be possitive and integer.", {
  expect_that(moezipfR.moments(k = 2.5, alpha = 3.5, beta = 1.3), throws_error())
  expect_that(moezipfR.moments(k = -2, alpha = 2.5, beta = 1.3), throws_error())
})
