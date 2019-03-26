context("ER")
library(modi)

test_that("Sum of good observations and outliers is equal to number of rows of data", {
  data(bushfirem, bushfire.weights)
  invisible(capture.output(det.res <- ER(bushfirem, weights = bushfire.weights, alpha = 0.05,
                                         steps.output = TRUE, em.steps = 100, tol = 2e-6)))
  expect_equal(length(det.res$good.data) + length(det.res$outliers), nrow(bushfirem))
})
