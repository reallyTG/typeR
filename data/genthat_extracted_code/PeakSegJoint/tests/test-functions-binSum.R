library(testthat)
context("binSum")
library(PeakSegJoint)

test_that("binSum with negative chromStart", {
  chromEnd <- 1:10
  profile <- data.frame(chromStart=chromEnd-1L,
                        chromEnd,
                        count=1L)
  bins <- binSum(profile,
                 bin.chromStart=-1L,
                 bin.size=3L,
                 n.bins=5L)
  expect_equal(bins$count, c(2, 3, 3, 2))
})

test_that("binSum 1bp with constant 1 profile", {
  profile <- data.frame(chromStart=0L,
                        chromEnd=10000L,
                        count=1L)
  bins <- binSum(profile,
                 bin.chromStart=0L,
                 bin.size=1L,
                 n.bins=2000L)
  expect_identical(bins$chromStart, 0:1999)
  expect_identical(bins$chromEnd, 1:2000)
  expect_identical(bins$count, rep(1L, 2000))
  expect_equal(bins$mean, rep(1, 2000))
})

test_that("binSum 2bp with constant 1 profile", {
  profile <- data.frame(chromStart=0L,
                        chromEnd=10000L,
                        count=1L)
  bins <- binSum(profile,
                 bin.chromStart=0L,
                 bin.size=2L,
                 n.bins=2000L)
  expect_identical(bins$chromStart, as.integer(seq(0, by=2, l=2000)))
  expect_identical(bins$chromEnd, as.integer(seq(2, by=2, l=2000)))
  expect_identical(bins$count, rep(2L, 2000))
  expect_equal(bins$mean, rep(1, 2000))
})

test_that("binSum 3bp with non-constant profile", {
  ## bins of size 3bp.
  ## -1-   -3-   -5-
  ##    -2-   -4-
  ## 123456789012345 base index.
  ## --2---
  ##       --1-
  ##           --0-------
  ## Coverage profile.
  profile <- data.frame(chromStart=as.integer(c(0, 6, 10)),
                        chromEnd=as.integer(c(6, 10, 10000)),
                        count=as.integer(c(2, 1, 0)))
  bins <- binSum(profile,
                 bin.chromStart=0L,
                 bin.size=3L,
                 n.bins=2000L)
  expect_identical(bins$chromStart, as.integer(seq(0, by=3, l=2000)))
  expect_identical(bins$chromEnd, as.integer(seq(3, by=3, l=2000)))
  expected.total <- rep(0L, 2000)
  expected.total[1:4] <- as.integer(c(6, 6, 3, 1))
  expect_identical(bins$count, expected.total)
  expected.mean <- expected.total/3
  expect_equal(bins$mean, expected.mean)
})

test_that("binSum 3bp with non-constant profile + 1000", {
  ## bins of size 3bp.
  ## -1-   -3-   -5-
  ##    -2-   -4-
  ## 123456789012345 base index + 1000.
  ## --2---
  ##       --1-
  ##           --0-------
  ## Coverage profile.
  profile <- data.frame(chromStart=as.integer(c(0, 1000, 1006, 1010)),
                        chromEnd=as.integer(c(1000, 1006, 1010, 10000)),
                        count=as.integer(c(0, 2, 1, 0)))
  bins <- binSum(profile,
                 bin.chromStart=1000L,
                 bin.size=3L,
                 n.bins=2000L)
  expect_identical(bins$chromStart, as.integer(seq(1000, by=3, l=2000)))
  expect_identical(bins$chromEnd, as.integer(seq(1003, by=3, l=2000)))
  expected.total <- rep(0L, 2000)
  expected.total[1:4] <- as.integer(c(6, 6, 3, 1))
  expect_identical(bins$count, expected.total)
  expected.mean <- expected.total/3
  expect_equal(bins$mean, expected.mean)
})

test_that("binSum returns short data.frame if coverage ends", {
  profile <- data.frame(chromStart=as.integer(c(0, 100)),
                        chromEnd=as.integer(c(100, 200)),
                        count=as.integer(c(10, 5)))
  bins <- binSum(profile,
                 bin.chromStart=0L,
                 bin.size=10L,
                 n.bins=10L)
  expect_equal(bins$mean, rep(10, 10))

  bins <- binSum(profile,
                 bin.chromStart=0L,
                 bin.size=10L,
                 n.bins=20L)
  expect_equal(bins$mean, rep(c(10, 5), each=10))

  bins <- binSum(profile,
                 bin.chromStart=0L,
                 bin.size=10L,
                 n.bins=30L)
  expect_equal(bins$mean, rep(c(10, 5), each=10))

  bins <- binSum(profile,
                 bin.chromStart=0L,
                 bin.size=30L,
                 n.bins=10L)
  expect_equal(bins$mean,
               c(10, 10, 10, 200/30, 5, 5, 100/30))
  expect_identical(bins$chromStart,
                   as.integer(c(0, 30, 60, 90, 120, 150, 180)))
  expect_identical(bins$chromEnd,
                   as.integer(c(30, 60, 90, 120, 150, 180, 210)))
})

test_that("chromEnd <= chromStart is an error", {
  bad <- data.frame(chromStart=as.integer(c(0, 10)),
                    chromEnd=as.integer(c(10, 5)),
                    count=0L)
  expect_error({
    binSum(bad, 0L, 30L, 10L)
  }, "chromStart not less than chromEnd")
})

test_that("chromStart[i] < chromEnd[i-1] is an error", {
  bad <- data.frame(chromStart=as.integer(c(0, 10)),
                    chromEnd=as.integer(c(15, 20)),
                    count=1L)
  expect_error({
    binSum(bad, 0L, 5L, 4L)
  }, "chromStart before previous chromEnd")
})

test_that("gaps are treated as counts of 0", {
  ok <- data.frame(chromStart=as.integer(c(0, 15)),
                    chromEnd=as.integer(c(10, 20)),
                    count=as.integer(c(1, 10)))
  by2 <- binSum(ok, 0L, 2L, 10L)
  expect_equal(by2$count, c(2, 2, 2, 2, 2,
                            0, 0, 10, 20, 20))
  by3 <- binSum(ok, 0L, 3L, 7L)
  expect_equal(by3$count, c(3, 3, 3, 1, 0, 30, 20))
  by5 <- binSum(ok, 0L, 5L, 4L)
  expect_equal(by5$count, c(5, 5, 0, 50))
  by10 <- binSum(ok, 0L, 10L, 2L)
  expect_equal(by10$count, c(10, 50))
  big <- binSum(ok, 0L, 100L, 1L)
  expect_equal(big$count, 60L)
  two <- binSum(ok, 0L, 15L, 2L)
  expect_equal(two$count, c(10, 50))
  small <- binSum(ok, 0L, 16L, 2L)
  expect_equal(small$count, c(20, 40))
})

test_that("no segfault", {
  data(H3K36me3.TDH.other.chunk1)
  some.counts <-
    subset(H3K36me3.TDH.other.chunk1$counts,
           43100000 < chromEnd & chromStart < 43205000)
  param.values <-
    c(2, 3, 5, 10, 15, 20, 25, 30, 50, 75, 100, 125, 150,
      200, 300, 400, 500, 600)
  for(param in param.values){
    param.name <- paste(param)
    param.int <- as.integer(param)
    fit <- PeakSegJointHeuristic(some.counts, param.int)
  }
})

