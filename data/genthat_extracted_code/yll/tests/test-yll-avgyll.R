test_that("10 equals 10", {

  expect_identical(10, 10)

})

test_that("yll works properly", {

  expect_identical(yll(1, 20, 0), 0)

})

test_that("gives an error if missing value", {

  expect_error(yll(0, 2))

})

test_that("gives an error if non-numeric value", {

  expect_error(yll("a", 0, 20))

})

test_that("output of yll is numeric", {

  expect_output(str(yll(20,20,20)), class = "num")

})
