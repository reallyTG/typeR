context('fit_and_categorize')

test_that('fit_and_categorize with double-sigmoidal input', {
  set.seed(5783)
  time <- seq(3, 24, 0.5)
  noise_parameter <- 0.2
  intensity_noise <- runif(n = length(time), min = 0, max = 1) * noise_parameter
  intensity <- doublesigmoidalFitFormula(time,
                                         finalAsymptoteIntensityRatio = .3,
                                         maximum = 4,
                                         slope1Param = 1,
                                         midPoint1Param = 7,
                                         slope2Param = 1,
                                         midPointDistanceParam = 8)
  intensity <- intensity+intensity_noise
  dataInput <- data.frame(time, intensity)
  fitObj <- fitAndCategorize(dataInput,
                             threshold_minimum_for_intensity_maximum = 0.3,
                             threshold_intensity_range = 0.1,
                             threshold_t0_max_int = 0.05)

  # check that final decision is correct
  expect_equal(fitObj$decisionProcess$decision, "double_sigmoidal")

  # more tests needed here
})

