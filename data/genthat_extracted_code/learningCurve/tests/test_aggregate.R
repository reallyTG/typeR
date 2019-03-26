test_that("agg_curve operates correctly with different arguments", {
  
  t <- c(70, 45, 25)
  r <- c(.85, .87, .8)
  
  expect_that(round(agg_curve(t = t, r = r, n = 300), 2), equals(11000.96))
  expect_that(round(agg_curve(t = t, r = r, n = 5), 2), equals(477.28))
  expect_that(agg_curve(t = c(t, NA), r = r, n = 5, na.rm = TRUE), shows_message())
  expect_that(agg_curve(t = c(t, "a"), r = r, n = 5), throws_error())
  expect_that(agg_curve(t = t, r = c(r, "a"), n = 5), throws_error())
  expect_that(agg_curve(t = t, r = r, n = "a"), throws_error())
  expect_that(agg_curve(t = t, r = c(r, -1), n = 500), gives_warning())
  
})