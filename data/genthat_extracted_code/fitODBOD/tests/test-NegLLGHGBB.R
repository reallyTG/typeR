context ("Scenario of un wanted inputs")
test_that("NA values are avoided",{
          expect_that(NegLLGHGBB(NA,4,0.1,3,3),
          throws_error("NA or Infinite or NAN values in the Input"))
          })
test_that("Infinite values are avoided",{
          expect_that(NegLLGHGBB(Inf,4,0.1,3,3),
          throws_error("NA or Infinite or NAN values in the Input"))
          })
test_that("NAN values are avoided",{
          expect_that(NegLLGHGBB(NaN,4,0.1,3,3),
          throws_error("NA or Infinite or NAN values in the Input"))
          })

context("Shape parameter issues")
test_that("shape parameter a",{
          expect_that(NegLLGHGBB(2,4,-3,3,6),
          throws_error("Shape parameters cannot be less than or equal to zero"))
          })
test_that("shape parameter b",{
          expect_that(NegLLGHGBB(2,4,1,-3,5),
          throws_error("Shape parameters cannot be less than or equal to zero"))
          })
test_that("shape parameter c",{
          expect_that(NegLLGHGBB(2,4,1,1,-3),
          throws_error("Shape parameters cannot be less than or equal to zero"))
          })

context("Binomial Random variable or frequency issues")
test_that("Negativity Binomial random variable",{
          expect_that(NegLLGHGBB(-3,4,0.2,4,3),
          throws_error("Binomial random variable or frequency values cannot be negative"))
          })
test_that("Negativity Binomial random variable",{
          expect_that(NegLLGHGBB(3,-2,0.2,4,3),
          throws_error("Binomial random variable or frequency values cannot be negative"))
          })
