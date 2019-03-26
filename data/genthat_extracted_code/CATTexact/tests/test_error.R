library(CATTexact)
context("Error")

test_that("Error when input vectors have different sizes", {
  expect_error(catt_exact(c(0,1,2), c(5,5,5), c(3,3,3,4)),"Length of input is differing!")
  expect_error(catt_asy(c(0,1,2), c(5,5,5), c(3,3,3,4)),"Length of input is differing!")
})

test_that("Error when there are less than three groups", {
  expect_error(catt_exact(c(0,1), c(5,5), c(3,3)),"Need at least three groups")
  expect_error(catt_asy(c(0,1), c(5,5), c(3,3)),"Need at least three groups")
})

test_that("Error when cases or totals are noninteger", {
  expect_error(catt_exact(c(0,1,2), c(5,5,5.1), c(3,3,3)),"The number of totals and cases must be integer")
  expect_error(catt_asy(c(0,1,2), c(5,5,5.1), c(3,3,3)),"The number of totals and cases must be integer")
  expect_error(catt_exact(c(0,1,2), c(5,5,5), c(3,3.1,3)),"The number of totals and cases must be integer")
  expect_error(catt_asy(c(0,1,2), c(5,5,5), c(3,3.1,3)),"The number of totals and cases must be integer")
})

test_that("Error when a group is empty or negative", {
  expect_error(catt_exact(c(0,1,2), c(5,0,5), c(1,0,3)),"There must be at least one individual in every dose group")
  expect_error(catt_asy(c(0,1,2), c(5,0,5), c(1,0,3)),"There must be at least one individual in every dose group")
  expect_error(catt_exact(c(0,1,2), c(5,-1,5), c(1,-1,3)),"There must be at least one individual in every dose group")
  expect_error(catt_asy(c(0,1,2), c(5,-1,5), c(1,-1,3)),"There must be at least one individual in every dose group")
})

test_that("Error when cases are negative", {
    expect_error(catt_exact(c(0,1,2), c(5,1,5), c(1,-1,3)),"The number of cases in each group must be nonnegative")
  expect_error(catt_asy(c(0,1,2), c(5,1,5), c(1,-1,3)),"The number of cases in each group must be nonnegative")
})


test_that("Error when there are more cases than totals", {
  expect_error(catt_exact(c(0,1,2), c(5,1,5), c(1,2,3)),"The number of cases can not exceed the size of the group")
  expect_error(catt_asy(c(0,1,2), c(5,1,5), c(1,2,3)),"The number of cases can not exceed the size of the group")
})


test_that("Error when there are no cases", {
  expect_error(catt_exact(c(0,1,2), c(5,1,5), c(0,0,0)),"This test can not be applied, when there is no case")
  expect_error(catt_asy(c(0,1,2), c(5,1,5), c(0,0,0)),"This test can not be applied, when there is no case")
})

test_that("Error when there are only cases", {
  expect_error(catt_exact(c(0,1,2), c(5,1,5), c(5,1,5)),"This test can not be applied, when the number of cases equals the total number of individuals")
  expect_error(catt_asy(c(0,1,2), c(5,1,5), c(5,1,5)),"This test can not be applied, when the number of cases equals the total number of individuals")
})

test_that("Error when doses are not strictly monotonic", {
  expect_error(catt_exact(c(0,1,1), c(5,2,5), c(3,2,4)),"Doses must be strictly monotonically increasing")
  expect_error(catt_asy(c(0,1,1), c(5,2,5), c(3,1,4)),"Doses must be strictly monotonically increasing")
  expect_error(catt_exact(c(2,4,3), c(5,2,5), c(3,2,4)),"Doses must be strictly monotonically increasing")
  expect_error(catt_asy(c(2,4,3), c(5,2,5), c(3,1,4)),"Doses must be strictly monotonically increasing")
})
