context("test regression")
test_that("Regression as classification", {
    data("Servo")
    rf = randomForest(Class ~., data = Servo, ntree = 10)
    expect_is(
      localICE(
        instance = Servo[1,],
        data = Servo,
        feature_1 = "Motor",
        feature_2 = "Screw",
        target = "Class",
        model = rf,
        regression = F,
        step_1 = 1,
        step_2 = 1
      )
    , "ggplot")
    expect_is(
      localICE(
        instance = Servo[1,],
        data = Servo,
        feature_1 = "Pgain",
        feature_2 = "Vgain",
        target = "Class",
        model = rf,
        regression = F,
        step_1 = 1,
        step_2 = 1
      )
      , "ggplot")
    expect_is(
      localICE(
        instance = Servo[1,],
        data = Servo,
        feature_1 = "Pgain",
        feature_2 = "Screw",
        target = "Class",
        model = rf,
        regression = F,
        step_1 = 1,
        step_2 = 1
      )
      , "ggplot")
    expect_is(
      localICE(
        instance = Servo[1,],
        data = Servo,
        feature_1 = "Motor",
        feature_2 = "Pgain",
        target = "Class",
        model = rf,
        regression = F,
        step_1 = 1,
        step_2 = 1
      )
      , "ggplot")
})
