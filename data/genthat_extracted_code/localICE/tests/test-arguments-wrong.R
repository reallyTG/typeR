context("wrong arguments")

test_that("aruments", {

    rf = randomForest(Species ~., data = iris, ntree = 10)

    # instance (missing comma)
    expect_error(
      localICE(
        instance = iris[1],
        data = iris,
        feature_1 = "Sepal.Length",
        feature_2 = "Petal.Width",
        target = "Species",
        model = rf,
        regression = F,
        step_1 = 0.5,
        step_2 = 0.5
      )
    )
    # data (character)
    expect_error(
      localICE(
        instance = iris[1,],
        data = "iris",
        feature_1 = "Sepal.Length",
        feature_2 = "Petal.Width",
        target = "Species",
        model = rf,
        regression = F,
        step_1 = 0.5,
        step_2 = 0.5
      )
    )
    # feauture_1 (no character)
    expect_error(
      localICE(
        instance = iris[1,],
        data = iris,
        feature_1 = Sepal.Length,
        feature_2 = "Petal.Width",
        target = "Species",
        model = rf,
        regression = F,
        step_1 = 0.5,
        step_2 = 0.5
      )
    )
    # feauture_2 (no character)
    expect_error(
      localICE(
        instance = iris[1,],
        data = iris,
        feature_1 = "Sepal.Length",
        feature_2 = Petal.Width,
        target = "Species",
        model = rf,
        regression = F,
        step_1 = 0.5,
        step_2 = 0.5
      )
    )
    # target (no character)
    expect_error(
      localICE(
        instance = iris[1,],
        data = iris,
        feature_1 = "Sepal.Length",
        feature_2 = "Petal.Width",
        target = Species,
        model = rf,
        regression = F,
        step_1 = 0.5,
        step_2 = 0.5
      )
    )
    # model (character)
    expect_error(
      localICE(
        instance = iris[1,],
        data = iris,
        feature_1 = "Sepal.Length",
        feature_2 = "Petal.Width",
        target = "Species",
        model = "rf",
        regression = F,
        step_1 = 0.5,
        step_2 = 0.5
      )
    )
    # wrong step_1
    expect_error(
      localICE(
        instance = iris[1,],
        data = iris,
        feature_1 = "Sepal.Length",
        feature_2 = "Petal.Width",
        target = "Species",
        model = rf,
        regression = F,
        step_1 = 0,
        step_2 = 0.5
      )
    )
    # wrong step_2
    expect_error(
      localICE(
        instance = iris[1,],
        data = iris,
        feature_1 = "Sepal.Length",
        feature_2 = "Petal.Width",
        target = "Species",
        model = rf,
        regression = F,
        step_1 = 0.5,
        step_2 = 0
      )
    )

    # wrong data input (character)
    expect_error(
      localICE(
        instance = iris[1,],
        data = "iris",
        feature_1 = "Sepal.Length",
        feature_2 = "Petal.Width",
        target = "Species",
        model = rf,
        regression = F,
        step_1 = 0.5,
        step_2 = 0.5
      )
    )
    # wrong data input (numeric)
    expect_error(
      localICE(
        instance = iris[1,],
        data = 1,
        feature_1 = "Sepal.Length",
        feature_2 = "Petal.Width",
        target = "Species",
        model = rf,
        regression = F,
        step_1 = 0.5,
        step_2 = 0.5
      )
    )
    # predict.fun (not found)
    explanation = localICE(
      instance = iris[1,],
      data = iris,
      feature_1 = "Sepal.Length",
      feature_2 = "Petal.Width",
      target = "Species",
      model = rf,
      regression = F,
      predict.fun = function(model,newdata){},
      step_1 = 0.5,
      step_2 = 0.5
    )
    expect_class(explanation, "ggplot")
    # wrong step_1 (too big)
    rf = randomForest(Petal.Width ~., data = iris, ntree = 10)
    expect_error(
      localICE(
        instance = iris[1,],
        data = iris,
        feature_1 = "Sepal.Length",
        feature_2 = "Species",
        target = "Petal.Width",
        model = rf,
        regression = F,
        step_1 = 10,
        step_2 = 0.5
      )
    )
    # wrong step_2 (too big)
    expect_error(
      localICE(
        instance = iris[1,],
        data = iris,
        feature_1 = "Species",
        feature_2 = "Sepal.Length",
        target = "Petal.Width",
        model = rf,
        regression = F,
        step_1 = 0.5,
        step_2 = 10
      )
    )
    # data has wrong type (character)
      data = iris
      data$Species = as.character(data$Species)
      rf = randomForest(Petal.Width ~., data = iris, ntree = 10)
      expect_error(
        localICE(
          instance = iris[1,],
          data = data,
          feature_1 = "Sepal.Length",
          feature_2 = "Species",
          target = "Petal.Width",
          model = rf,
          regression = F,
          step_1 = 0.5,
          step_2 = 0.5
        )
      )
})
