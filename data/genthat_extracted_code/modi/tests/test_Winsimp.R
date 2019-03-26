context("Winsorization and Imputation")
library(modi)

test_that("Dimension of input data is equal to dimension of output data", {
  data(bushfirem, bushfire.weights)
  invisible(capture.output(det.res <- TRC(bushfirem, weight = bushfire.weights)))
  imp.res <- Winsimp(bushfirem, det.res$output$center, det.res$output$scatter, det.res$outind)
  expect_equal(dim(bushfirem), dim(imp.res$imputed.data))
})
