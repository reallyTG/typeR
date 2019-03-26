library(epos)
context("test_readSecondLevelATC")

test_that("Test function readSecondLevelATC()", {
  atchashsec <-
    readSecondLevelATC(
    system.file("extdata", "drugbankatc-secondlevel.map", package = "epos"), "\t")
  expect_that(length(atchashsec$keys()), equals(89))
})