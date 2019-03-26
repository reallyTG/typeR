test_that("Test datatable_past", {
  skip_on_cran()
  expect_gt(length(get_benchmarks()), 1)
  expect_equal(length(get_benchmarks(collapse = TRUE)), 1)
}
)