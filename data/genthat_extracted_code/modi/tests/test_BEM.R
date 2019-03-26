context("BEM")
library(modi)

test_that("Length of output vector is equal to no. of rows of input data", {
  data(bushfirem, bushfire.weights)
  invisible(capture.output(bem.res <- BEM(bushfirem, bushfire.weights,
                                          alpha = (1 - 0.01 / nrow(bushfirem)))))
  expect_equal(length(bem.res$outind), dim(bushfirem)[1])
})
