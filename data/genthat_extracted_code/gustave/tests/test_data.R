
context("data")

test_that("example data are OK", {
  expect_equal(sum(ict_sample$w_sample[ict_sample$scope]), sum(ict_sample$w_nrc[ict_sample$resp]))
  expect_true(all(ict_sample$response_prob_est <= 1, na.rm = TRUE))
  expect_equal(sum(ict_sample$w_sample), sum(ict_sample$w_calib))
  expect_equal(
    tapply(ict_pop$turnover, ict_pop$division, sum),
    tapply(ict_sample$turnover * ict_sample$w_calib, ict_sample$division, sum)
  )
  expect_equal(
    tapply(ict_pop$firm_id, ict_pop$division, length),
    tapply(ict_sample$w_calib, ict_sample$division, sum)
  )
})