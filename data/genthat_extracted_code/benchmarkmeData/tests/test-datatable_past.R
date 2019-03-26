test_that("Test datatable_past", {
  skip_on_cran()
  # expect_true(is.list(get_datatable_past("prog")))
  # #  expect_true(is.list(get_datatable_past(test_group="matrix_fun")))
  # # expect_true(is.list(get_datatable_past("prog", blas_optimize = TRUE)))
  # expect_true(is.list(get_datatable_past("prog", blas_optimize = FALSE)))
  expect_error(get_datatable_past("prog1"))
  
}
)
