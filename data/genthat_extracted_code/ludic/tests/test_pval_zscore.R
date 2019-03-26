library(ludic)
context("Z-score p-value")

test_that("-1.96 and 1.96 both have p-value 0.05", {
  expect_equal(round(pval_zscore(1.96, 1), 4), 0.05)
  expect_equal(round(pval_zscore(-1.96, 1), 4), 0.05)
  
})


