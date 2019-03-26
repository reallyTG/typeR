context ("Scenario of un wanted inputs")
test_that("NA values are avoided",{
  expect_that(NegLLBetaCorrBin(NA,4,0.1,.3,1),
              throws_error("NA or Infinite or NAN values in the Input"))
})
test_that("Infinite values are avoided",{
  expect_that(NegLLBetaCorrBin(Inf,4,0.1,.3,1),
              throws_error("NA or Infinite or NAN values in the Input"))
})
test_that("NAN values are avoided",{
  expect_that(NegLLBetaCorrBin(NaN,4,0.1,.3,1),
              throws_error("NA or Infinite or NAN values in the Input"))
})

context("Binomial Random variable or frequency issues")
test_that("Negativity Binomial random variable",{
  expect_that(NegLLBetaCorrBin(-3,4,0.2,0.4,1),
              throws_error("Binomial random variable or frequency values cannot be negative"))
})
test_that("Negativity frequency values",{
  expect_that(NegLLBetaCorrBin(-3,4,0.2,0.4,1),
              throws_error("Binomial random variable or frequency values cannot be negative"))
})

context("Correlation limitations")
test_that("Correlation above maximum limit",{
  expect_that(NegLLBetaCorrBin(3,5,9,0.2,0.2),
              throws_error("Correlation cannot be greater than 1 or Lesser than -1 or it cannot be greater than Maximum Correlation or Lesser than Minimum Correlation"))
})
test_that("Correlation above 1",{
  expect_that(NegLLBetaCorrBin(3,5,19,0.2,0.2),
              throws_error("Correlation cannot be greater than 1 or Lesser than -1 or it cannot be greater than Maximum Correlation or Lesser than Minimum Correlation"))
})
test_that("Correlation below minimum limit",{
  expect_that(NegLLBetaCorrBin(3,5,-9,0.2,0.2),
              throws_error("Correlation cannot be greater than 1 or Lesser than -1 or it cannot be greater than Maximum Correlation or Lesser than Minimum Correlation"))
})
test_that("Correlation below -1",{
  expect_that(NegLLBetaCorrBin(3,5,-19,0.2,0.2),
              throws_error("Correlation cannot be greater than 1 or Lesser than -1 or it cannot be greater than Maximum Correlation or Lesser than Minimum Correlation"))
})
