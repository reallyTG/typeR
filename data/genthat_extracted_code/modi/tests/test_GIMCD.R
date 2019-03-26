context("GIMCD")
library(modi)

test_that("Number of rows is equal to dimension of mean vector", {
  data(bushfirem)
  invisible(capture.output(det.res <- GIMCD(bushfirem, alpha = 0.1)))
  expect_equal(dim(bushfirem)[2], length(det.res$center))
})
