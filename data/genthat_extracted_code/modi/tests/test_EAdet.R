context("EAdet")
library(modi)

test_that("Length of vector with infected nodes is equal to no. of rows of input data", {
  data(bushfirem, bushfire.weights)
  invisible(capture.output(det.res <- EAdet(bushfirem, bushfire.weights, plotting = FALSE)))
  expect_equal(length(det.res$infected), dim(bushfirem)[1])
})
