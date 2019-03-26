context("Errors")

test_that("unknown annotations generate errors", {
  regions <-
    data.frame(chrom="chr1", chromStart=1, chromEnd=10, annotation="foo")
  expect_error({
    PeakError(Peaks(), regions)
  }, "annotations must be one of: noPeaks, peakStart, peakEnd")
})

test_that("overlaps generate errors", {
  overlapping.regions <-
    data.frame(chrom="chr1",
               chromStart=c(1, 5),
               chromEnd=c(10, 20),
               annotation="noPeaks")
  expect_error({
    PeakError(Peaks(), overlapping.regions)
  }, "overlapping regions")
  
  regions <-
    data.frame(chrom="chr1", chromStart=1, chromEnd=10, annotation="noPeaks")
  overlapping.peaks <- Peaks("chr1", c(1, 5), c(10, 20))
  expect_error({
    PeakError(overlapping.peaks, regions)
  }, "overlapping peaks")
})
