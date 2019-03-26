context("Examples")

## chr1 has 249250621 bases -- we should test if we can compute near
## this limit.
expect_tp_fp <- function(regions, peaks, tp, fp){
  err <- PeakError(peaks, regions)
  expect_equal(err$tp, tp)
  expect_equal(err$fp, fp)
  big <- 249250000L
  peaks$chromStart <- peaks$chromStart + big
  peaks$chromEnd <- peaks$chromEnd + big
  regions$chromEnd <- regions$chromEnd + big
  regions$chromStart <- regions$chromStart + big
  err <- PeakError(peaks, regions)
  expect_equal(err$tp, tp)
  expect_equal(err$fp, fp)
}

test_that("1 peakStart region examples correct", {
  regions <-
    data.frame(chrom="chr5", chromStart=10, chromEnd=20, annotation="peakStart")
  expect_tp_fp(regions, Peaks("chr5", 15, 25), 1, 0)
  expect_tp_fp(regions, Peaks(), 0, 0)
  expect_tp_fp(regions, Peaks("chr5", 20, 30), 0, 0)
  expect_tp_fp(regions, Peaks("chr12", 12, 15), 0, 0)
  expect_tp_fp(regions, Peaks("chr5", 12, 15), 1, 0)
  expect_tp_fp(regions, Peaks("chr5", c(12, 18), c(15, 25)), 1, 1)
  expect_tp_fp(regions, Peaks("chr5", c(5, 15), c(12, 18)), 1, 0)
  expect_tp_fp(regions, Peaks("chr5", 5, 12), 0, 0)
  expect_tp_fp(regions, Peaks("chr5", 5, 25), 0, 0)
})

test_that("1 peakEnd region examples correct", {
  regions <-
    data.frame(chrom="chr5", chromStart=10, chromEnd=20, annotation="peakEnd")
  expect_tp_fp(regions, Peaks("chr5", 15, 25), 0, 0)
  expect_tp_fp(regions, Peaks(), 0, 0)
  expect_tp_fp(regions, Peaks("chr5", 20, 30), 0, 0)
  expect_tp_fp(regions, Peaks("chr12", 12, 15), 0, 0)
  expect_tp_fp(regions, Peaks("chr5", 12, 15), 1, 0)
  expect_tp_fp(regions, Peaks("chr5", c(12, 18), c(15, 25)), 1, 0)
  expect_tp_fp(regions, Peaks("chr5", c(5, 15), c(12, 18)), 1, 1)
  expect_tp_fp(regions, Peaks("chr5", 5, 12), 1, 0)
  expect_tp_fp(regions, Peaks("chr5", 5, 25), 0, 0)
})

test_that("1 noPeaks region examples correct", {
  regions <-
    data.frame(chrom="chr5", chromStart=10, chromEnd=20, annotation="noPeaks")
  expect_tp_fp(regions, Peaks("chr5", 15, 25), 0, 1)
  expect_tp_fp(regions, Peaks(), 0, 0)
  expect_tp_fp(regions, Peaks("chr5", 20, 30), 0, 0)
  expect_tp_fp(regions, Peaks("chr12", 12, 15), 0, 0)
  expect_tp_fp(regions, Peaks("chr5", 12, 15), 0, 1)
  expect_tp_fp(regions, Peaks("chr5", c(12, 18), c(15, 25)), 0, 1)
  expect_tp_fp(regions, Peaks("chr5", c(5, 15), c(12, 18)), 0, 1)
  expect_tp_fp(regions, Peaks("chr5", 5, 12), 0, 1)
  expect_tp_fp(regions, Peaks("chr5", 5, 25), 0, 1)
})

test_that("1 peaks region examples correct", {
  regions <-
    data.frame(chrom="chr5", chromStart=10, chromEnd=20, annotation="peaks")
  expect_tp_fp(regions, Peaks("chr5", 15, 25), 1, 0)
  expect_tp_fp(regions, Peaks(), 0, 0)
  expect_tp_fp(regions, Peaks("chr5", 20, 30), 0, 0)
  expect_tp_fp(regions, Peaks("chr12", 12, 15), 0, 0)
  expect_tp_fp(regions, Peaks("chr5", 12, 15), 1, 0)
  expect_tp_fp(regions, Peaks("chr5", c(12, 18), c(15, 25)), 1, 0)
  expect_tp_fp(regions, Peaks("chr5", c(5, 15), c(12, 18)), 1, 0)
  expect_tp_fp(regions, Peaks("chr5", 5, 12), 1, 0)
  expect_tp_fp(regions, Peaks("chr5", 5, 25), 1, 0)
})

test_that("1 of each region examples correct", {
  x <- seq(5, 85, by=5)
  peaks <- rbind(Peaks("chr2", x, x+3),
                 Peaks("chr3", c(25, 38, 57), c(33, 54, 75)),
                 Peaks("chr4", c(5, 32, 38, 65), c(15, 35, 55, 85)),
                 Peaks("chr5", c(12, 26, 56, 75), c(16, 54, 59, 85)))
  regions <- NULL
  for(chr in 1:5){
    regions <- rbind(regions, {
      data.frame(chrom=paste0("chr", chr),
                 chromStart=c(10, 30, 50, 70),
                 chromEnd=c(20, 40, 60, 80),
                 annotation=c("noPeaks", "peakStart", "peakEnd", "peaks"))
    })
  }
  expect_tp_fp(regions, peaks,
               c(0, 0, 0, 0,
                 0, 1, 1, 1,
                 0, 1, 1, 1,
                 0, 1, 1, 1,
                 0, 0, 1, 1),
               c(0, 0, 0, 0,
                 1, 1, 1, 0,
                 0, 0, 0, 0,
                 1, 1, 0, 0,
                 1, 0, 1, 0))
})

test_that("noPeaks boundaries are correct", {
  regions <-
    data.frame(chrom="chr1", chromStart=4, chromEnd=8, annotation="noPeaks")
  expect_tp_fp(regions, Peaks("chr1", c(1, 8), c(4, 10)), 0, 0)
  expect_tp_fp(regions, Peaks("chr1", c(1, 8), c(5, 10)), 0, 1)
  expect_tp_fp(regions, Peaks("chr1", c(1, 7), c(4, 10)), 0, 1)
})

test_that("peaks boundaries are correct", {
  regions <-
    data.frame(chrom="chr1", chromStart=4, chromEnd=8, annotation="peaks")
  expect_tp_fp(regions, Peaks("chr1", c(1, 8), c(4, 10)), 0, 0)
  expect_tp_fp(regions, Peaks("chr1", c(1, 8), c(5, 10)), 1, 0)
  expect_tp_fp(regions, Peaks("chr1", c(1, 7), c(4, 10)), 1, 0)
})

test_that("peakStart boundaries are correct", {
  regions <-
    data.frame(chrom="chr1", chromStart=4, chromEnd=8, annotation="peakStart")
  expect_tp_fp(regions, Peaks("chr1", c(1, 8), c(4, 10)), 0, 0)
  expect_tp_fp(regions, Peaks("chr1", c(1, 8), c(5, 10)), 0, 0)
  expect_tp_fp(regions, Peaks("chr1", c(1, 7), c(4, 10)), 1, 0)
})

test_that("peakEnd boundaries are correct", {
  regions <-
    data.frame(chrom="chr1", chromStart=4, chromEnd=8, annotation="peakEnd")
  expect_tp_fp(regions, Peaks("chr1", c(1, 8), c(4, 10)), 0, 0)
  expect_tp_fp(regions, Peaks("chr1", c(1, 8), c(5, 10)), 1, 0)
  expect_tp_fp(regions, Peaks("chr1", c(1, 7), c(4, 10)), 0, 0)
})

