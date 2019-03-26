library(RcppCWB)

testthat::context("cl_cpos2lbound")

test_that(
  "cpos2lbound",
  {
    cpos <- cl_cpos2lbound(
      corpus = "REUTERS",
      s_attribute = "places",
      cpos = 5L,
      registry = use_tmp_registry()
    )
    expect_equal(cpos, 0)
  }
)
