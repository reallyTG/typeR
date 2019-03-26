library(RcppCWB)

testthat::context("cl_id2cpos")

test_that(
  "id2cpos",
  {
    cpos <- cl_id2cpos(
      corpus = "REUTERS",
      p_attribute = "word",
      id = 15,
      registry = get_tmp_registry()
    )
    expect_equal(sum(cpos), 155788L)
  }
)
