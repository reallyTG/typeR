library(RcppCWB)

testthat::context("get_region_matrix")

test_that(
  "get_region_matrix",
  {
    regions <- get_region_matrix(
      corpus = "REUTERS",
      s_attribute = "places",
      strucs = 0L:5L,
      registry = get_tmp_registry()
    )
    expect_equal(sum(regions), 6476L)
  }
)

