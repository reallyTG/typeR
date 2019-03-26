context("max_velocity_detector")

test_that("max_velocity_detector works", {
  library(behavr)
  dt <- toy_ethoscope_data(duration=days(2))
  dt[, test:= rnorm(nrow(dt))]
  data <- dt[,-c("id")]
  data[t %in% c(10.5, 11, 11.5, 1001, 3401.5), has_interacted := 1]

  small_d <- max_velocity_detector(data, 10)
  expect_equal(small_d[, sum(interactions)], data[, sum(has_interacted)])
})


test_that("max_velocity_detector wans when no interaction and masking", {
  library(behavr)
  dt <- toy_ethoscope_data(duration=days(2))
  dt[, test:= rnorm(nrow(dt))]
  dt[, has_interacted := NULL]
  data <- dt[,-c("id")]
  expect_warning(small_d <- max_velocity_detector(data, 10),
                 "Cannot apply masking")

  # no warning here
  small_d <- max_velocity_detector(data, 10, masking_duration = 0)

})
