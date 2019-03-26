context("Test chiSqPeriodogram")

oscillation <- sin(seq(0, 2 * pi * 1, by = 2 * pi / 1440))
oscillation.df <- data.frame(dateTime = 1:length(oscillation), value = oscillation)

test_that("calc ChiSqPeriodogram",{
  result <- chiSqPeriodogram(oscillation.df)
  expect_equal(sum(result[1]), 6020)
})
