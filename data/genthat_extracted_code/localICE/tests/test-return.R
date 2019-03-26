context("return ggplot object")

test_that("Return ggplot2 object", {
  # classification with numerical feature
  rf = randomForest(Species ~., data = iris, ntree = 10)
  explanation = localICE(
    instance = iris[3,],
    data = iris,
    feature_1 = "Sepal.Length",
    feature_2 = "Petal.Width",
    target = "Species",
    model = rf,
    regression = F,
    step_1 = 0.5,
    step_2 = 0.5)
    expect_class(explanation, "ggplot")

    # regression with one catergorical feature
    rf = randomForest(Petal.Width ~., data = iris, ntree = 10)
    explanation = localICE(
      instance = iris[3,],
      data = iris,
      feature_1 = "Sepal.Length",
      feature_2 = "Species",
      target = "Petal.Width",
      model = rf,
      regression = T,
      step_1 = 0.5,
      step_2 = 0.5)
    expect_class(explanation, "ggplot")
})
