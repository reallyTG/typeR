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

# Run Tests
test_that("rfout was successful in all calculations.", {
  # OOB Predictions
  expect_equal(unname(round(rfout@oob_predictions@pred_mat[90, 1], 4)), 25.6958)
  # Model Used
  expect_equal(rfout@model_used, "medv ~ lstat | rad + tax + crim")
  # Training Respones - The correct subset was used
  expect_equal(round(mean(rfout@train_response$medv), 4), 21.6922)
  # Variable Importance Matrix
  expect_equal(
    unname(round(rfout@varimp_object@varimp_matrix[2, 1], 4)), 3.5593)
  # General R2 is calculated correctly
  expect_equal(round(rfout@general_predictions@overall_r2, 4), 0.6611)
})
