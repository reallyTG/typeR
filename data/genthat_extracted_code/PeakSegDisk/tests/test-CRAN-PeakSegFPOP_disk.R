library(testthat)
context("PeakSegFPOP_disk")
library(PeakSegDisk)

test_that("error when input file does not exist", {
  expect_error({
    .C(
      "PeakSegFPOP_interface",
      bedGraph.file = "foo/bar/sars", 
      penalty = "10.5",
      PACKAGE = "PeakSegDisk")
  }, "unable to open input file for reading")
})

r <- function(chrom, chromStart, chromEnd, coverage){
  data.frame(chrom, chromStart, chromEnd, coverage)
}
four <- rbind(
  r("chr1", 0, 10,  2),
  r("chr1", 10, 20, 10),
  r("chr1", 20, 30, 14),
  r("chr1", 30, 40, 13))
write.table(
  four, tmp <- tempfile(),
  sep="\t", row.names=FALSE, col.names=FALSE)

test_that("character penalty works", {
  names.list <- PeakSegFPOP_disk(tmp, "10.5")
  unlink(names.list$db)
  seg.df <- read.table(names.list$segments)
  names(seg.df) <- c("chrom", "chromStart", "chromEnd", "status", "mean")
  expect_equal(paste(seg.df$chrom), c("chr1", "chr1", "chr1"))
  expect_equal(seg.df$chromStart, c(30, 10, 0))
  expect_equal(seg.df$chromEnd, c(40, 30, 10))
  expect_equal(paste(seg.df$status), c("background", "peak", "background"))
  m <- mean(four$coverage[-1])
  expected.mean <- c(m, m, four$coverage[1])
  expect_equal(seg.df$mean, expected.mean, tol=1e-3)
  loss.df <- read.table(names.list$loss)
  names(loss.df) <- c(
    "penalty", "segments", "peaks", "bases",
    "mean.pen.cost", "total.loss", "equality.constraints",
    "mean.intervals", "max.intervals")
})

test_that("error for numeric penalty", {
  expect_error({
    PeakSegFPOP_disk(tmp, 10.5)
  }, "pen.str must be a character string that can be converted to a non-negative numeric scalar")
})

