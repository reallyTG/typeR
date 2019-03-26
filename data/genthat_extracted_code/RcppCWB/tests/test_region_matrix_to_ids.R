library(RcppCWB)

testthat::context("region_matrix_to_ids")

test_that(
  "regions_to_ids",
  {
    ids <- region_matrix_to_ids(
      corpus = "REUTERS",
      p_attribute = "word",
      registry = use_tmp_registry(),
      matrix = matrix(c(0, 91), nrow = 1)
    )
    expect_equal(tail(ids, n = 6L), c(55L, 56L, 41L, 15L, 57L, 58L))
  }
)
