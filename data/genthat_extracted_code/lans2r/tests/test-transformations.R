context("Data transformations")

test_that("test that transformation safety checks are in place", {
  expect_error(spread_data(data_frame()), "column not in dataset: 'variable'")
  expect_error(spread_data(data_frame(variable = "A")), "column not in dataset: 'value'")
  expect_error(spread_data(data_frame(variable = "A", value = 5)), "column not in dataset: 'sigma'")
  expect_error(spread_data(data_frame(variable = "A", value = 5, sigma = 1)), "column not in dataset: 'data_type'")
  expect_error(spread_data(data_frame(variable = "A", value = 5, sigma = 1, data_type = "b"),
                           values = FALSE, errors = FALSE), "neither errors nor values")
  
  a <- data_frame(variable = "A", ROI = 1:5, value = runif(5), sigma = 0.1, data_type = "temp")
  b <- data_frame(variable = "B", ROI = 1:5, value = rnorm(5), sigma = 0.2, data_type = "temp")
  expect_equal(
    spread_data(bind_rows(a,b)),
    full_join(
      a %>% rename(A = value, `A sigma` = sigma) %>% select(-data_type, -variable),
      b %>% rename(B = value, `B sigma` = sigma) %>% select(-data_type, -variable),
      by = "ROI"
    ))
})