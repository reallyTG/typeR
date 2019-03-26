library(RcppCWB)

testthat::context("cl_cpos2str")

test_that(
  "cpos2str",
  {
    token <- cl_cpos2str(
      corpus = "REUTERS",
      p_attribute = "word",
      registry = use_tmp_registry(),
      cpos = 0L:3L
    )
    expect_equal(token, c("Diamond", "Shamrock", "Corp", "said"))
  }
)
