df <- data.frame(
  contract = 1:10,
  x_attribute = c(0.92, 0.79, 1.00, 0.39, 0.68, 0.55, 0.73, 0.76, 1.00, 0.74),
  y_attribute = c(0.52, 0.19, 0.62, 1.00, 0.55, 0.52, 0.53, 0.46, 0.61, 0.84)
  )

test_that("MAVF_sensitivity provides proper messages and warnings", {

  expect_that(
    MAVF_sensitivity(df, x_attribute, y_attribute, .75, .35, .25, .45),
    throws_error()
  )

  expect_that(
    MAVF_sensitivity(df, x_attribute, y_attribute, .55, .75, .55, .35),
    throws_error()
  )

  expect_that(
    MAVF_sensitivity(df, x_att, y_attribute, .55, .75, .25, .45),
    throws_error()
  )

})

test_that("MAVF_sensitivity has correct dimensions and output type", {

  expect_equal(MAVF_sensitivity(df, x_attribute, y_attribute, .55, .75, .25, .45) %>% nrow(), 10)
  expect_equal(MAVF_sensitivity(df, x_attribute, y_attribute, .55, .75, .25, .45) %>% ncol(), 10)
  expect_true(MAVF_sensitivity(df, x_attribute, y_attribute, .55, .75, .25, .45) %>% is.data.frame())

})

test_that("MAVF_sensitivity computes correctly", {

  expect_equal(MAVF_sensitivity(df, x_attribute, y_attribute, .55, .75, .25, .45) %>% sapply(is.na) %>% sum(), 0)

})
