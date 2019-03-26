library(RcppCWB)

testthat::context("get_count_vector")

test_that(
  "get_count_vector",
  {
    Ns <- get_count_vector(
      corpus = "REUTERS",
      p_attribute = "word",
      registry = use_tmp_registry()
    )
    expect_equal(length(Ns), 1192)
    expect_equal(Ns[16], 78L)
  }
)
