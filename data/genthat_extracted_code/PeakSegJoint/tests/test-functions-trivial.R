library(testthat)
context("trivial")
library(PeakSegJoint)

count <-
  as.integer(c(rep(c(0, 1), each=5),
               rep(c(10, 11), each=10),
               rep(c(0, 1), each=5)))

test_that("with 1 sample we refine peaks" , {
  chromEnd <- seq_along(count)
  profiles <-
    data.frame(chromStart=chromEnd-1L,
               chromEnd,
               sample.id="sample1",
               count)
  fit <- PeakSegJointHeuristic(profiles)
  converted <- ConvertModelList(fit)
  peak <- converted$peaks
  expect_equal(peak$chromStart, 10)
  expect_equal(peak$chromEnd, 30)
})

test_that("chromEnd <= chromStart is an error", {
  bad <- data.frame(chromStart=as.integer(c(0, 100)),
                    chromEnd=as.integer(c(100, 50)),
                    count=0L,
                    sample.id="foo")
  expect_error({
    PeakSegJointHeuristic(bad)
  }, "chromStart not less than chromEnd")
})

test_that("chromStart[i] < chromEnd[i-1] is an error", {
  bad <- data.frame(chromStart=as.integer(c(0, 100)),
                    chromEnd=as.integer(c(150, 200)),
                    count=0L,
                    sample.id="foo")
  expect_error({
    PeakSegJointHeuristic(bad)
  }, "chromStart before previous chromEnd", fixed=TRUE)
})

empty <- 
  data.frame(sample.id=character(),
             chrom=character(),
             chromStart=integer(),
             chromEnd=integer(),
             count=integer())

test_that("no computable models error for empty coverage data", {
  expect_error({
    fit <- PeakSegJointSeveral(empty)
  }, "No computable models")
})

test_that("no coverage error for empty coverage data", {
  expect_error({
    fit <- PeakSegJointHeuristic(empty)
  }, "no coverage data")
})
