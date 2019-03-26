testthat::context("Testing the additional methods used by the predict function (predict_prob, predict_mean, predict_median).")

#We test these prediction methods with (mostly) a linear survival curve because it is the easiest to understand.


# predict_prob ------------------------------------------------------------
testthat::test_that("predict_prob spline functionality",{
  survival_curve <- seq(1,0,length.out = 101)
  predicted_times <- 0:100

  expect_equal(predict_prob(survival_curve, predicted_times, 0.5), 0.995)
  expect_equal(predict_prob(survival_curve, predicted_times, 49.5), 0.505)
  expect_equal(predict_prob(survival_curve, predicted_times, 50), 0.50)
  expect_equal(predict_prob(survival_curve, predicted_times, 99), 0.01)
  expect_equal(predict_prob(survival_curve, predicted_times, 99.5), 0.005)
})

testthat::test_that("predict_prob flat survival curve",{
  survival_curve <- seq(1,0,length.out = 101)
  predicted_times <- 0:100

  expect_equal(predict_prob(survival_curve, predicted_times, 0), 1.00)
  expect_equal(predict_prob(survival_curve, predicted_times, -10), 1.00)
  expect_equal(predict_prob(survival_curve, predicted_times, 100), 0.00)
  expect_equal(predict_prob(survival_curve, predicted_times, 150), 0)

  survival_curve <- rep(1,101)
  predicted_times <- 0:100

  expect_equal(predict_prob(survival_curve, predicted_times, 0), 1.00)
  expect_equal(predict_prob(survival_curve, predicted_times, 100), 1.00)
  expect_equal(predict_prob(survival_curve, predicted_times, 150), 1.00)
  expect_equal(predict_prob(survival_curve, predicted_times, 1000), 1.00)
})

testthat::test_that("predict_prob linear extension functionality",{
  survival_curve <- seq(1,.5,length.out = 51)
  predicted_times <- 0:50

  expect_equal(predict_prob(survival_curve, predicted_times, 51), 0.49)
  expect_equal(predict_prob(survival_curve, predicted_times, 75), 0.25)
  expect_equal(predict_prob(survival_curve, predicted_times, 100), 0.00)
  expect_equal(predict_prob(survival_curve, predicted_times, 150), 0)
})









# predict_mean ------------------------------------------------------------
testthat::test_that("predict_mean functionality",{
  #Full linear survival curve
  survival_curve <- seq(1,0,length.out = 101)
  predicted_times <- 0:100
  expect_equal(predict_mean(survival_curve, predicted_times), 50)

  #Linear extension
  survival_curve <- seq(1,.5,length.out = 51)
  predicted_times <- 0:50
  expect_equal(predict_mean(survival_curve, predicted_times), 50)

  #Infinite survival curve
  survival_curve <- rep(1,101)
  predicted_times <- 0:100
  expect_equal(predict_mean(survival_curve, predicted_times), Inf)

  #Zero survival curve
  survival_curve <- rep(0,101)
  predicted_times <- 0:100
  expect_equal(predict_mean(survival_curve, predicted_times), 0)
})

# predict_median ------------------------------------------------------------
testthat::test_that("predict_median functionality",{
  #Full linear survival curve
  survival_curve <- seq(1,0,length.out = 101)
  predicted_times <- 0:100
  expect_equal(predict_median(survival_curve, predicted_times), 50)

  #Linear extension
  survival_curve <- seq(1,.7,length.out = 31)
  predicted_times <- 0:30
  expect_equal(predict_median(survival_curve, predicted_times), 50)

  survival_curve <- seq(1,.3,length.out = 71)
  predicted_times <- 0:70
  expect_equal(predict_median(survival_curve, predicted_times), 50)

  #Infinite survival curve
  survival_curve <- rep(1,101)
  predicted_times <- 0:100
  expect_equal(predict_median(survival_curve, predicted_times), Inf)

  #Zero survival curve
  survival_curve <- rep(0,101)
  predicted_times <- 0:100
  expect_equal(predict_median(survival_curve, predicted_times), 0)
})







