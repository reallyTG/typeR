set.seed(1111)
data("BostonHousing", package = "mlbench")
data <- BostonHousing[1:90, c("rad", "tax", "crim", "medv", "lstat")]
fmBH <- mob.rf.tree(main_model = "medv ~ lstat",
                     partition_vars = c("rad", "tax", "crim"), mtry = 2,
                     control = mob_control(), data = data,
                     model = linearModel)

values <- sapply(1:nrow(data), tree.predictions, df = data, tree = fmBH@tree)

# Run Tests
test_that("tree.predictions is accurate for all calculations.", {
  # Overall predictions
  skip_on_cran()
  expect_equal(round(mean(values), 4), 21.6922)
})
