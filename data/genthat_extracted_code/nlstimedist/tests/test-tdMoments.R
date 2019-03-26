context("Test the moments functions: tdMoments")

test_that("Ensure the moment functions are returning the expected values", {
  # Test the moment functions
  testMoments <- tdMoments(r = 0.01, c = 0.05, t = 150)
  expectMoments <- structure(
    list(
      mean = 163.052803793855,
      variance = 5056.10338063086,
      sd = 71.1062822866648,
      skew = 3.0181112733389,
      kurtosis = 15.073882436058,
      entropy = 7.64843298497888),
    .Names = c("mean", "variance", "sd", "skew", "kurtosis", "entropy"),
    row.names = c(NA, -1L),
    class = "data.frame")
  expect_equal(testMoments, expectMoments)

  # Test the alternative kurtosis formula
  testAltKurtosis <- tdKurtosis(r = 0.01, c = 0.05, t = 150, alternative = TRUE)
  expectAltKurtosis <- 15.073882436058
  expect_equal(testAltKurtosis, expectAltKurtosis)
})
