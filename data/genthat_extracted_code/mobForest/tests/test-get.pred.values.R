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

result <- get.pred.values(rfout)


# Run Tests
test_that("get.pred.values was successful in getting predicted values.", {
  # Predicted mean for first observation
  expect_equal(unname(round(result[1, 1], 4)), 23.2199)
  # Predicted STD for third observation
  expect_equal(unname(round(result[3, 2], 4)), 0.5209)
  # Residual for first observation
  expect_equal(unname(round(result[1, 3], 4)), 0.7801)
})
