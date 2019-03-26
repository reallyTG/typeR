library(RcppCWB)

testthat::context("cpos2struc")

test_that(
  "cpos2struc",
  {
    N <- cl_cpos2struc(
      corpus = "REUTERS",
      s_attribute = "places",
      cpos = 100L,
      registry = get_tmp_registry()
    )
    expect_equal(N, 1L)
  }
)
