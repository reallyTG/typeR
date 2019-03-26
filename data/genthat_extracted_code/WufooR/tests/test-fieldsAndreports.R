library(testthat)
library(WufooR)

options(Wufoo_Name = "johnmalc", Wufoo_API = "S6VI-I8UA-BY11-TDHO")

context("Fields")

test_that("Fields request returns 17 rows, always", {
  fieldsALL <- fields_info(formIdentifier = "z5kqx7h1gtvg4g")
  expect_gt(dim(fieldsALL)[1], 1)
})

context("Reports")

test_that("Reports have 11 fields", {
  repo <- reports_info()
  expect_equal(dim(repo)[2], 11)
})
