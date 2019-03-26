library(RcppCWB)

testthat::context("cl_str2id")

test_that(
  "str2id",
  {
    id <- cl_str2id(
      corpus = "REUTERS",
      p_attribute = "word",
      str = "oil",
      registry = get_tmp_registry()
    )
    expect_equal(id, 15L)
  }
)
