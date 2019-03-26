library("rtimicropem")
#################################################################################################
context("summary method")
#################################################################################################
test_that("the print method works", {
  data("micropemC1")
  sumup <- micropemC1$summary()
  expect_that(sumup,
              is_a("tbl_df"))
  expect_equal(nrow(sumup), 7)
  expect_equal(ncol(sumup), 7)
  expect_true(all(names(sumup) == c("measure",
                               "no._of_not_missing_values",
                               "median",
                               "mean",
                               "minimum",
                               "maximum",
                               "variance")))
  expect_true(all(unlist(lapply(sumup, class)) == c("character",
                               "integer",
                               "numeric",
                               "numeric",
                               "numeric",
                               "numeric",
                               "numeric")))
})
