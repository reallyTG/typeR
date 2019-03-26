context("Read/Write Test")

test_that("read/write do not affect content", {
  data("population_magpie")
  mag <- population_magpie
  names(dimnames(mag)) <- NULL
  getNames(mag) <- c("A2-A","B1-A")
  for(ext in c(".csv",".cs3",".cs4")) {
    tmpfile <- tempfile(fileext = ext)
    write.magpie(mag,tmpfile)
    mag2 <- read.magpie(tmpfile)
    names(dimnames(mag2)) <- NULL
    expect_equal(mag,mag2)
  }
})

