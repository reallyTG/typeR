# Create Data
response <- matrix(c(rep(0, 100), rep(10, 100)))
predictions <-
    matrix(nrow = 200, ncol = 3,
           data = c(rep(1, 100), rep(8, 100), rep(1, 100), rep(8, 100),
                    rep(1, 100), rep(8, 100)))
compute.mse(response, predictions)


# Run Tests
test_that("response and prediction have same number of rows", {
  expect_error(compute.mse(response[1:10, ], predictions),
               "incorrect number of dimensions")
})

test_that("compute.mse calculates the MSE value using the average prediction", {
  expect_equal(compute.mse(response, predictions), 2.5)
})
