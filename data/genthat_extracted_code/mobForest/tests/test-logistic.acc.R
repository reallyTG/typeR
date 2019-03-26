# Create Data
response <- matrix(c(rep(0, 10), rep(1, 10)))
predicted <- c(rep(.1, 15), rep(.8, 5))
a <- logistic.acc(response, predicted)


# Run Tests
test_that("response and prediction have same number of rows", {
  expect_error(logistic.acc(response[1:10, ], predicted),
               "incorrect number of dimensions")
})

test_that("logistic.acc diagonal should be overall accuracy", {
  expect_equal( (a[1] + a[4]) / sum(a),
               .75)
})
