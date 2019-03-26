library(RcppCWB)

testthat::context("cl_lexicon_size")

test_that(
  "lexicon size",
  {
    N <- cl_lexicon_size(
      corpus = "REUTERS",
      p_attribute = "word",
      registry = get_tmp_registry()
    )
    expect_equal(N, 1192)
  }
)
