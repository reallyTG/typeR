context("POEM")
library(modi)

test_that("Dimension of imputed data is equal to dimension of input data", {
  data(bushfirem, bushfire.weights)
  outliers <- rep(0, nrow(bushfirem))
  outliers[31:38] <- 1
  invisible(capture.output(imp.res <- POEM(bushfirem, bushfire.weights,
                                           outliers,preliminary.mean.imputation = TRUE)))
  expect_equal(dim(imp.res$imputed.data), dim(bushfirem))
})
