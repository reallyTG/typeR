context("eezsvshighseas")

test_that("eezsvshighseas works", {
  skip_on_cran()

  tt <- eezsvshighseas()

  expect_named(tt, c("year", "eez_percent_catch", "high_seas_percent_catch"))
  expect_type(tt$eez_percent_catch, "double")
  expect_type(tt$high_seas_percent_catch, "double")
})
