context("EAimp")
library(modi)

test_that("Dimension of imputed data is equal to dimension of input data", {
  data(bushfirem, bushfire.weights)
  invisible(capture.output(det.res <- EAdet(bushfirem, bushfire.weights, plotting = FALSE)))
  invisible(capture.output(imp.res <- EAimp(bushfirem, bushfire.weights,
                                            outind = det.res$outind,
                                            reach = det.res$output$max.min.di, kdon = 3)))
  expect_equal(dim(imp.res$imputed.data), dim(bushfirem))
})
