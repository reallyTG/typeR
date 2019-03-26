context("Test the percentiles function: tdPercentiles")

test_that("Ensure tdPercentiles returns the expected values", {
  data   <- lobelia[lobelia$Temperature == 12.5, ]
  data   <- tdData(data, x = "Day", y = "Germination")
  model  <- timedist(data, x = "Day", y = "propMax", r = 0.1, c = 0.5, t = 10)
  test   <- tdPercentiles(model, n = seq(0.1, 0.9, 0.1))
  test <- round(test, 3)
  expect <- structure(
    c(9.159, 10.383, 11.269, 12.073, 12.919, 13.952, 15.517, 18.776, 26.447),
    .Names = c("10%", "20%", "30%", "40%", "50%", "60%", "70%", "80%", "90%"))
  expect_equal(test, expect)
})
