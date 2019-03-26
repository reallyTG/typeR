library(testthat)
library(dmutate)
library(dplyr)
Sys.setenv(R_TESTS="")


context("test-covset")

test_that("covset is generated from formulae", {
  cov1 <- covset(Y ~ rnorm(0,1), Z~runif(0,1))
  cov1 <- as.list(cov1)
  expect_equal(length(cov1),2)
  a <- cov1[[1]]
  b <- cov1[[2]]
  expect_equal(a$dist,"rnorm")
  expect_equal(b$dist,"runif")
})

test_that("covset is generated from character", {
  cov1 <- covset("Y ~ rbinomial(0.4)", "Z~rlnorm(log(5),1)")
  cov1 <- as.list(cov1)
  expect_equal(length(cov1),2)
  a <- cov1[[1]]
  b <- cov1[[2]]
  expect_equal(a$dist,"rbinomial")
  expect_equal(b$dist,"rlnorm")
})





