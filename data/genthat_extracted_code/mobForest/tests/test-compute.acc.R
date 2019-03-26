# Create Data
response <- as.data.frame( c(rep(0, 10000), rep(1, 10000)))
predictions <-
  matrix(nrow = 20000, ncol = 3,
         data = c(rep(.1, 15000), rep(.8, 5000), rep(.1, 15000),
                  rep(.8, 5000), rep(.1, 15000), rep(.8, 5000)))

compute.acc(response, predictions)


# Run Tests
test_that("response and prediction have same number of rows", {
  expect_error(compute.acc(response[1:10, ], predictions),
               "incorrect number of dimensions")
})

test_that("compute.acc calculates accuracy using the average prediction", {
  expect_equal(compute.acc(response, predictions), .75)
})
