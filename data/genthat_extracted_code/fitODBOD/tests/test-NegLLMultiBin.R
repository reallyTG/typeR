context ("Scenario of un wanted inputs")
test_that("NA values are avoided",{
          expect_that(NegLLMultiBin(NA,4,0.1,.3),
          throws_error("NA or Infinite or NAN values in the Input"))
          })
test_that("Infinite values are avoided",{
          expect_that(NegLLMultiBin(Inf,4,0.1,.3),
          throws_error("NA or Infinite or NAN values in the Input"))
          })
test_that("NAN values are avoided",{
          expect_that(NegLLMultiBin(NaN,4,0.1,.3),
          throws_error("NA or Infinite or NAN values in the Input"))
          })

context("Binomial Random variable or frequency issues")
test_that("Negativity Binomial random variable",{
          expect_that(NegLLMultiBin(-3,4,0.2,0.4),
          throws_error("Binomial random variable or frequency values cannot be negative"))
          })
test_that("Negativity frequency values",{
          expect_that(NegLLMultiBin(-3,4,0.2,0.4),
          throws_error("Binomial random variable or frequency values cannot be negative"))
          })

context("Probability value issues")
test_that("Probability issues",{
          expect_that(NegLLMultiBin(3,5,3,0.4),
          throws_error("Probability or Theta parameter value doesnot satisfy conditions"))
          })
test_that("Probability issues",{
          expect_that(NegLLMultiBin(3,5,-3,0.4),
          throws_error("Probability or Theta parameter value doesnot satisfy conditions"))
          })
test_that("Theta issues",{
          expect_that(NegLLMultiBin(3,5,0.3,-1),
          throws_error("Probability or Theta parameter value doesnot satisfy conditions"))
          })
