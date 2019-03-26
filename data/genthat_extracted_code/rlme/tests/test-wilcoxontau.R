context("Wilcoxontau")

test_that("Wilcoxontau is same as ww version", {
  resd = rnorm(100)
  p = 3
  
  expect_equal(wilcoxontau(resd, p), wilcoxontau.ww(resd, p))
})