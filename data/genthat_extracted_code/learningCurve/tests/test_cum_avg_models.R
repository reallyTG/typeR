test_that("ca_unit operates correctly with different arguments", {
  
  expect_that(round(ca_unit(t = 110, m = 1, n = 2200, r = .885), 3), equals(23.34))
  expect_that(round(ca_unit(t = 225, m = 5, n = 350, r = .75), 3), equals(36.909))
  expect_that(ca_unit(t = c(225, NA), m = 5, n = 350, r = .75, na.rm = TRUE), shows_message())
  expect_that(ca_unit(t = "225", m = 5, n = 350, r = .75), throws_error())
  expect_that(ca_unit(t = 225, m = "5", n = 350, r = .75), throws_error())
  expect_that(ca_unit(t = 225, m = 5, n = "350", r = .75), throws_error())
  expect_that(ca_unit(t = 225, m = 5, n = 350, r = -.1), gives_warning())
  
})

test_that("ca_block operates correctly with different arguments", {
  
  expect_that(round(ca_block(t = 75, m = 201, n = 250, r = .85), 2), equals(806.77))
  expect_that(round(ca_block(t = 125, m = 55, n = 165, r = .75), 2), equals(1188.61))
  expect_that(ca_block(t = c(75, NA), m = 201, n = 250, r = .85, na.rm = TRUE), shows_message())
  expect_that(ca_block(t = "75", m = 201, n = 250, r = .85), throws_error())
  expect_that(ca_block(t = 75, m = "201", n = 250, r = .85), throws_error())
  expect_that(ca_block(t = 75, m = 201, n = "250", r = .85), throws_error())
  expect_that(ca_block(t = 75, m = 100, n = 90, r = .885), throws_error())
  
})