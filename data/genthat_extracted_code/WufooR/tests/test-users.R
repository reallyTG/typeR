library(testthat)
library(WufooR)

options(Wufoo_Name = "johnmalc", Wufoo_API = "S6VI-I8UA-BY11-TDHO")

context("Users")

test_that("User request returns 17 rows, always", {
  userDB <- user_info()
  expect_equal(dim(userDB)[2], 17)
})
