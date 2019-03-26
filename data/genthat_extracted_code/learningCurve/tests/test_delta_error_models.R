test_that("delta operates correctly with different arguments", {
  
  expect_that(round(delta(t = 50, m = 1, n = 5, r = .885), 2), equals(c(0.00, 5.75, 6.10, 6.11, 6.04)))
  expect_that(round(delta(t = 20, m = 6, n = 10, r = .9), 2), equals(c(0.00, 0.04, 0.07, 0.09, 0.10)))
  expect_that(round(delta(t = 20, m = 6, n = 10, r = .9, level = "c"), 2), equals(c(0.00, 0.04, 0.11, 0.19, 0.30)))
  expect_that(delta(t = 20, m = 6, n = 10, r = .9, level = "error"), throws_error())
  expect_that(delta(t = 20, m = 6, n = 10, r = -.1), gives_warning())
  
})

test_that("cum_error operates correctly with different arguments", {
  
  expect_that(round(cum_error(n = 250, r1 = .85, r2 = .87), 3), equals(0.204))
  expect_that(round(cum_error(n = 400, r1 = .75, r2 = .87), 3), equals(2.607))
  expect_that(is.character(cum_error(n = 250, r1 = .85, r2 = .85)), is_true())
  expect_that(cum_error(n = "250", r1 = .85, r2 = .85), throws_error())
  expect_that(cum_error(n = 250, r1 = ".85", r2 = .85), throws_error())
  expect_that(cum_error(n = 250, r1 = .85, r2 = ".85"), throws_error())
  
})