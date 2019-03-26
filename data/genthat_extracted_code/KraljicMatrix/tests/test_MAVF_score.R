x_attribute <- c(0.92, 0.79, 1.00, 0.39, 0.68, 0.55, 0.73, 0.76, 1.00, 0.74)
y_attribute <- c(0.52, 0.19, 0.62, 1.00, 0.55, 0.52, 0.53, 0.46, 0.61, 0.84)

test_that("MAVF_score provides proper messages and warnings", {

  expect_that(
    MAVF_score(x_attribute, y_attribute[-1], x_wt = .65, y_wt = .35),
    throws_error()
  )

  expect_that(
    MAVF_score(x_attribute, y_attribute, x_wt = c(.65, .2), y_wt = .35),
    throws_error()
  )

  expect_that(
    MAVF_score(x_attribute, y_attribute, x_wt = ".65", y_wt = .35),
    throws_error()
  )

})

test_that("MAVF_score has correct dimensions and output type", {

  expect_equal(MAVF_score(x_attribute, y_attribute, x_wt = .65, y_wt = .35) %>% length(), 10)
  expect_true(MAVF_score(x_attribute, y_attribute, x_wt = .65, y_wt = .35) %>% is.numeric())
  expect_true(MAVF_score(x_attribute, y_attribute, x_wt = .65, y_wt = .35) %>% is.atomic())

})

test_that("MAVF_score computes correctly", {

  expect_equal(MAVF_score(x_attribute, y_attribute, x_wt = .65, y_wt = .35) %>% round(2) %>% .[2], .58)
  expect_equal(MAVF_score(x_attribute, y_attribute, x_wt = .45, y_wt = .55) %>% round(2) %>% .[2], .46)

})
