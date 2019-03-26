test_that("unit_curve operates correctly with different arguments", {
  
  expect_that(round(unit_curve(t = 100, m = 1, n = 125, r = .85), 3), equals(32.236))
  expect_that(round(unit_curve(t = 100, m = 100, n = 125, r = .85), 3), equals(94.903))
  expect_that(unit_curve(t = c(100, NA), m = 1, n = 125, r = .85, na.rm = TRUE), shows_message())
  expect_that(unit_curve(t = "100", m = 1, n = 125, r = .85, na.rm = TRUE), throws_error())
  expect_that(unit_curve(t = 100, m = "1", n = 125, r = .85, na.rm = TRUE), throws_error())
  expect_that(unit_curve(t = 100, m = 1, n = "125", r = .85, na.rm = TRUE), throws_error())
  expect_that(unit_curve(t = 100, m = 1, n = "125", r = -0.10, na.rm = TRUE), throws_error())
  
})

test_that("unit_cum_exact operates correctly with different arguments", {
  
  expect_that(round(unit_cum_exact(t = 100, n = 125, r = .85), 3), equals(5201.085))
  expect_that(round(unit_cum_exact(t = 100, n = 125, r = .1), 3), equals(114.890))
  expect_that(unit_cum_exact(t = c(100, NA), n = 125, r = .85, na.rm = TRUE), shows_message())
  expect_that(unit_cum_exact(t = "100", n = 125, r = .85), throws_error())
  expect_that(unit_cum_exact(t = 100, n = "125", r = .85), throws_error())
  expect_that(unit_cum_exact(t = 100, n = 125, r = ".85"), throws_error())
  expect_that(unit_cum_exact(t = 100, n = 90, m = 100, r = 0.10), throws_error())
})

test_that("unit_cum_appx operates correctly with different arguments", {
  
  expect_that(round(unit_cum_appx(t = 100, n = 125, r = .85), 3), equals(5202.988))
  expect_that(round(unit_cum_appx(t = 100, n = 125, r = .1), 3), equals(215.338))
  expect_that(unit_cum_appx(t = c(100, NA), n = 125, r = .85, na.rm = TRUE), shows_message())
  expect_that(unit_cum_appx(t = "100", n = 125, r = .85), throws_error())
  expect_that(unit_cum_appx(t = 100, n = "125", r = .85), throws_error())
  expect_that(unit_cum_appx(t = 100, n = 125, r = ".85"), throws_error())
  expect_that(unit_cum_appx(t = 100, n = 90, m = 100, r = 0.10), throws_error())
})

test_that("unit_midpoint operates correctly with different arguments", {
  
  expect_that(round(unit_midpoint(m = 201, n = 500, r = .75), 3), equals(334.61))
  expect_that(round(unit_midpoint(m = 201, n = 500, r = .1), 3), equals(303.091))
  expect_that(unit_midpoint(m = "100", n = 125, r = .85), throws_error())
  expect_that(unit_midpoint(m = 100, n = "125", r = .85), throws_error())
  expect_that(unit_midpoint(m = 100, n = 125, r = ".85"), throws_error())
  expect_that(unit_midpoint(m = 100, n = 90, m = 100, r = 0.10), throws_error())
})

test_that("unit_block_summary operates correctly with different arguments", {
  
  expect_that(is.list(unit_block_summary(t = 125, m = 201, n = 500, r = .75)), is_true())
  expect_that(unit_block_summary(t = "125", m = 201, n = 500, r = .75), throws_error())
  expect_that(unit_block_summary(t = 125, m = "201", n = 500, r = .75), throws_error())
  expect_that(unit_block_summary(t = 125, m = 201, n = "500", r = .75), throws_error())
  expect_that(unit_block_summary(t = 125, m = 201, n = 500, r = ".75"), throws_error())
  expect_that(unit_block_summary(t = 125, m = 100, n = 90, r = ".75"), throws_error())
  expect_that(unit_block_summary(t = 125, m = 100, n = 90, r = -0.1), throws_error())
})

