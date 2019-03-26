context("h5-DataSet-scalar")

fname <- tempfile(fileext=".h5")

test_that("datatypes-Array-BugWithScalar",{
      fname <- system.file("test-scalar.h5", package = "hdf5r", mustWork = TRUE)
      f <- h5file(fname, "r")
      dset <- f[["/Analyses/Basecall_2D_000/BaseCalled_2D/Fastq"]]
      dat <- dset[]
      expect_identical(length(dat), 1L)
      expect_is(dat, "character")
      h5close(f)
    })
