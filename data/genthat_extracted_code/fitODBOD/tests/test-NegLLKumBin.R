context ("Scenario of un wanted inputs")
test_that("NA values are avoided",{
          expect_that(NegLLKumBin(NA,4,0.2,3),
          throws_error("NA or Infinite or NAN values in the Input"))
          })
test_that("Infinite values are avoided",{
          expect_that(NegLLKumBin(Inf,4,0.2,3),
          throws_error("NA or Infinite or NAN values in the Input"))
          })
test_that("NAN values are avoided",{
          expect_that(NegLLKumBin(NaN,4,0.3,3),
          throws_error("NA or Infinite or NAN values in the Input"))
          })

context("Binomial Random variable or frequency issues")
test_that("Negativity Binomial random variable",{
          expect_that(NegLLKumBin(-3,4,0.2,4),
          throws_error("Binomial random variable or frequency values cannot be negative"))
          })
test_that("Negativity frequency values",{
          expect_that(NegLLKumBin(-3,4,0.2,4),
          throws_error("Binomial random variable or frequency values cannot be negative"))
          })

context("Shape parameter issues")
test_that("Shape parameter a",{
          expect_that(NegLLKumBin(3,4,-3,4),
          throws_error("Shape parameters cannot be less than or equal to zero"))
          })
test_that("Shape parameter b",{
          expect_that(NegLLKumBin(3,4,1,-3),
          throws_error("Shape parameters cannot be less than or equal to zero"))
          })
context("Number of iterations")
test_that("Less than one",{
          expect_that(NegLLKumBin(2,4,0.4,0.5,-1),
          throws_error("Number of iterations cannot be less than one"))
          })
