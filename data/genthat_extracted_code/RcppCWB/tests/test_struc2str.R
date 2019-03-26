library(RcppCWB)

testthat::context("struc2str")

test_that(
  "struc2str",
  {
    sAttr <- cl_struc2str(
      corpus = "REUTERS",
      s_attribute = "places",
      struc = 2L,
      registry = get_tmp_registry()
    )
    expect_equal(sAttr, "canada")
  }
)
