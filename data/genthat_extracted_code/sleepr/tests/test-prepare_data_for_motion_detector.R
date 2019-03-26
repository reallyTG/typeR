context("prepare_data_for_motion_detector")

test_that("prepare_data_for_motion_detector works", {

  library(behavr)
  dt <- toy_ethoscope_data(duration=hours(1))
  dt[, test:= rnorm(nrow(dt))]
  data <- dt[,-c("id")]

  col_needed <- c("t", "xy_dist_log10x1000", "x")
  out <- sleepr:::prepare_data_for_motion_detector(data,
                                            col_needed,
                                            10,
                                            "has_interacted")

  expect_identical(sort(c(col_needed, "has_interacted", "t_round")), sort(names(out)))
  expect_true(all(out[,t-t_round] <10))

  # no optional column
  col_needed <- c("t", "xy_dist_log10x1000", "x")
  out <- sleepr:::prepare_data_for_motion_detector(data,
                                                   col_needed,
                                                   10)

  expect_identical(sort(c(col_needed, "t_round")), sort(names(out)))
  expect_true(all(out[,t-t_round] <10))
})



test_that("prepare_data_for_motion_detector errors when missing column", {
  library(behavr)
  dt <- toy_ethoscope_data(duration=hours(1))
  dt[, test:= rnorm(nrow(dt))]
  data <- dt[,-c("id")]

  col_needed <- c("t", "xy_dist_log10x1000", "x", "w")
  expect_error(sleepr:::prepare_data_for_motion_detector(data,
                                                   col_needed,
                                                   10,
                                                   "has_interacted"),
               "should have columns named.*w")
})
