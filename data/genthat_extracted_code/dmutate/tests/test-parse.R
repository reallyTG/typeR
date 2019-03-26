library(testthat)
library(dmutate)
library(dplyr)
Sys.setenv(R_TESTS="")



context("test-parse")

test_that("Formula LHS is parsed", {
  x <- dmutate:::parse_left_var("foo[1.2,]")
  expect_equal(x$lower, "1.2")
  expect_equal(x$upper, "Inf")
  expect_equal(x$var, "foo")


  x <- dmutate:::parse_left_var("fo.o[1.2,]")
  expect_equal(x$lower, "1.2")
  expect_equal(x$upper, "Inf")
  expect_equal(x$var, "fo.o")

  x <- dmutate:::parse_left_var("fo_o[,33.2]")
  expect_equal(x$var, "fo_o")
  expect_equal(x$upper, "33.2")

  x <- dmutate:::parse_left_var("foo[,]")
  expect_equal(x$lower, "-Inf")
  expect_equal(x$upper, "Inf")

  expect_error(dmutate:::parse_left_var("[1.1,2.2]"))
})


test_that("Formula RHS is parsed", {
  x <- dmutate:::parse_form_3("y~rnorm(0,1)",.GlobalEnv)
  expect_equal(x$dist, "rnorm")
  expect_equal(x$var, "y")

  x <- dmutate:::parse_form_3("z~runif(33,33.3)|ID",.GlobalEnv)
  expect_equal(x$dist, "runif")
  expect_equal(x$var, "z")
  expect_equal(x$by,"ID")

  x <- dmutate:::parse_form_3("A[1,]~rbinomial(0.2)|ar.m",.GlobalEnv)
  expect_equal(x$dist, "rbinomial")
  expect_equal(x$var, "A")
  expect_equal(x$by,"ar.m")
  expect_equal(eval(x$lower),1)
  expect_equal(eval(x$upper),Inf)
})



