library(testthat)
library(namedCapture)
context("engine")

subject <- "chr10:1-2"
pattern <- "(?<chrom>.*?):"
test_that("PCRE (?<name>pattern) syntax works", {
  namedCapture.engine("PCRE")
  match.mat <- str_match_named(subject, pattern)
  expect_identical(match.mat, cbind(chrom="chr10"))
})
test_that("RE2 (?<name>pattern) syntax is an error", {
  namedCapture.engine("RE2")
  expect_error({
    str_match_named(subject, pattern)
  }, "bad perl operator: (?<", fixed=TRUE)
})
