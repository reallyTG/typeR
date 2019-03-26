library(RcppCWB)

testthat::context("region_matrix_to_count_matrix")

test_that(
  "regions_to_count_matrix",
  {
    M <- region_matrix_to_count_matrix(
      corpus = "REUTERS",
      p_attribute = "word",
      registry = use_tmp_registry(),
      matrix = matrix(c(0, 91), nrow = 1)
    )
    expect_equal(M[16,2], 5L)
  }
)
