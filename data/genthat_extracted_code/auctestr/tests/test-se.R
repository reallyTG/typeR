context("AUC standard errors")

test_that("standard errors are as expected", {
  auc <- 0.75
  expect_gt(se_auc(auc, 10, 100), se_auc(auc, 20, 200))
  expect_gt(se_auc(auc, 50, 450), se_auc(auc, 250, 250))
  expect_equal(se_auc(auc, 0, 10), Inf)
  expect_equal(se_auc(auc, 10, 0), Inf)
})
