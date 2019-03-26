
context("standard_statistic_wrapper")

variance_wrapper <- define_variance_wrapper(
  variance_function = function(y) abs(colSums(y)), 
  reference_id = ict_survey$firm_id,
  reference_weight = ict_survey$w_calib,
  default_id = "firm_id"
)

test_that("standard linearization wrappers work", {
  expect_error(variance_wrapper(ict_survey, mean(speed_quanti)), regexp = NA)
  expect_error(variance_wrapper(ict_survey, mean(speed_quanti, by = division)), regexp = NA)
  expect_error(variance_wrapper(ict_survey, ratio(speed_quanti, turnover)), regexp = NA)
  expect_error(variance_wrapper(ict_survey, ratio(speed_quanti, turnover, by = division)), regexp = NA)
  expect_error(variance_wrapper(ict_survey, diff_of_ratio(speed_quanti, turnover, speed_quanti, employees)), regexp = NA)
  expect_error(variance_wrapper(ict_survey, diff_of_ratio(speed_quanti, turnover, speed_quanti, employees, by = division)), regexp = NA)
  expect_error(variance_wrapper(ict_survey, ratio_of_ratio(speed_quanti, turnover, speed_quanti, employees)), regexp = NA)
  expect_error(variance_wrapper(ict_survey, ratio_of_ratio(speed_quanti, turnover, speed_quanti, employees, by = division)), regexp = NA)
})