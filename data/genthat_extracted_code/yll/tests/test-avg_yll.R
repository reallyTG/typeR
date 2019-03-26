test_that("10 equals 10", {

  expect_identical(10, 10)

})

test_that("avg_yll works properly", {

  expect_identical(avg_yll(1, 20, 0), 0)

})

test_that("gives an error if missing value", {

  expect_error(avg_yll(0, 2))

})

test_that("gives an error if non-numeric value", {

  expect_error(avg_yll("a", 0, 20))

})

test_that("output of avg_yll is numeric", {

  expect_output(str(avg_yll(20,20,20)), class = "num")

})
