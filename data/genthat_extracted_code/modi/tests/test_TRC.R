context("TRC")
library(modi)

test_that("Length of output vector is equal to no. of rows of input data", {
  data(bushfirem, bushfire.weights)
  invisible(capture.output(det.res <- TRC(bushfirem, weights = bushfire.weights)))
  expect_equal(length(det.res$outind), dim(bushfirem)[1])
})
