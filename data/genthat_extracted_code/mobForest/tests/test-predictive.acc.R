set.seed(1111)
# Random Forest analysis of model based recursive partitioning load data
data("BostonHousing", package = "mlbench")
BostonHousing <- BostonHousing[1:90, c("rad", "tax", "crim", "medv", "lstat")]

rfout <-
  mobforest.analysis(
    as.formula(medv ~ lstat), c("rad", "tax", "crim"),
    mobforest_controls =
      mobforest.control(ntree = 3, mtry = 2, replace = T, alpha = 0.05,
                        bonferroni = T, minsplit = 25), data = BostonHousing,
    processors = 1, model = linearModel, seed = 1111)

values <- predictive.acc(rfout)

# Run Tests
test_that("predictive.acc function was successful in all calculations.", {
  # R2 for first tree
  expect_equal(round(values$oob_r2[1], 4), 0.5602)
  # General Overall MSE
  expect_equal(round(values$general_overall_mse, 4), 9.5902)
  # Overall R2
  expect_equal(round(values$oob_overall_r2, 4), 0.6562)
})
