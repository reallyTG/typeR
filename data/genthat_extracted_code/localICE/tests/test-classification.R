context("test classification")
test_that("Classification as regression", {
    data("Servo")
    rf = randomForest(Motor ~., data = Servo, ntree = 10)
    expect_error(
      localICE(
        instance = Servo[1,],
        data = Servo,
        feature_1 = "Motor",
        feature_2 = "Screw",
        target = "Motor",
        model = rf,
        regression = T,
        step_1 = 1,
        step_2 = 1
      )
    )
    expect_error(
      localICE(
        instance = Servo[1,],
        data = Servo,
        feature_1 = "Pgain",
        feature_2 = "Vgain",
        target = "Motor",
        model = rf,
        regression = T,
        step_1 = 1,
        step_2 = 1
      )
    )
    expect_error(
      localICE(
        instance = Servo[1,],
        data = Servo,
        feature_1 = "Pgain",
        feature_2 = "Screw",
        target = "Motor",
        model = rf,
        regression = T,
        step_1 = 1,
        step_2 = 1
      )
    )
    expect_error(
      localICE(
        instance = Servo[1,],
        data = Servo,
        feature_1 = "Motor",
        feature_2 = "Pgain",
        target = "Motor",
        model = rf,
        regression = T,
        step_1 = 1,
        step_2 = 1
      )
    )
})
