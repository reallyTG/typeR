test_that("Test plot_past", {
  skip_on_cran()
  expect_true(is.data.frame(plot_past("prog")))
  expect_true(is.data.frame(plot_past(test_group=c("matrix_fun"))))
  expect_true(is.data.frame(plot_past("prog", blas_optimize = NULL)))
  expect_error(plot_past("Prog"))
}
)
