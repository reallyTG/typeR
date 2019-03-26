library(testthat)
context("problem.PeakSegFPOP")
library(PeakSegDisk)

r <- function(chrom, chromStart, chromEnd, coverage){
  data.frame(chrom, chromStart, chromEnd, coverage)
}
supp <- rbind(
  r("chr1", 0, 1,  3),
  r("chr1", 1, 2, 9),
  r("chr1", 2, 3, 18),
  r("chr1", 3, 4, 15),
  r("chr1", 4, 5, 20),
  r("chr1", 5, 6, 2)
)
data.dir <- tempfile()
dir.create(data.dir)
write.table(
  supp, file.path(data.dir, "coverage.bedGraph"),
  sep="\t", row.names=FALSE, col.names=FALSE)

test_that("sequential search with too many peaks is an error", {
  expect_error({
    problem.sequentialSearch(data.dir, 5L)
  }, "peaks.int=5 but max=2 peaks for N=6 data")
})
