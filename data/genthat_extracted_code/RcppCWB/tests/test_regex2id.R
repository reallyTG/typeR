library(RcppCWB)

testthat::context("cl_regex2id")

test_that(
  "regex2id",
  {
    id <- cl_regex2id(
      corpus = "REUTERS",
      p_attribute = "word",
      regex = "[oO]il",
      registry = get_tmp_registry()
    )
    expect_equal(id, c(15L, 306L))
  }
)
