context("testing FBH method")

test_that("FBH method results are as expected", {
  auc1 = 0.56
  auc2 = 0.59
  expect_equal(fbh_test(auc1, auc2, 1000, 2500), (-1)*fbh_test(auc2, auc1, 1000, 2500))
  expect_equal(abs(fbh_test(auc1, auc2, 1000, 2500)), abs(fbh_test(auc2, auc1, 1000, 2500)))
  expect_lt(fbh_test(auc1, auc2, 1000, 2500), fbh_test(auc2, auc1, 2000, 5000))
})
