library(RcppCWB)

testthat::context("s_attribute_decode")

test_that(
  "s_attribute_decode",
  {
    sAttrDF <- s_attribute_decode(
      corpus = "REUTERS",
      s_attribute = "places",
      registry = use_tmp_registry(),
      method = "Rcpp"
    )
    expect_equal(sAttrDF[["value"]][1:4], c("usa", "usa", "canada", "usa"))
    expect_equal(nrow(sAttrDF), 20L)
  }
)
