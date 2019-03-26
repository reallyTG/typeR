context ("Scenario of un wanted inputs")
test_that("NA values are avoided",{
          expect_that(dKumBin(NA,4,0.1,3),
          throws_error("NA or Infinite or NAN values in the Input"))
          })
test_that("Infinite values are avoided",{
          expect_that(dKumBin(Inf,4,0.1,3),
          throws_error("NA or Infinite or NAN values in the Input"))
          })
test_that("NAN values are avoided",{
          expect_that(dKumBin(NaN,4,0.1,3),
          throws_error("NA or Infinite or NAN values in the Input"))
          })

context("Binomial random variable or trial value issues")
test_that("Random variable higher than Trial value",{
          expect_that(dKumBin(5,4,0.2,3),
          throws_error("Binomial random variable cannot be greater than binomial trial value"))
          })
test_that("Negativity",{
          expect_that(dKumBin(-3,4,0.2,3),
          throws_error("Binomial random variable or binomial trial value cannot be negative"))
          })
test_that("Random variable higher than Trial value",{
          expect_that(dKumBin(-8,-4,0.2,3),
          throws_error("Binomial random variable or binomial trial value cannot be negative"))
          })

context("Shape parameter issues")
test_that("shape parameter a",{
          expect_that(dKumBin(2,4,-3,3),
          throws_error("Shape parameters cannot be less than or equal to zero"))
          })
test_that("shape parameter b",{
          expect_that(dKumBin(2,4,1,-3),
          throws_error("Shape parameters cannot be less than or equal to zero"))
          })

context("Number of iterations")
test_that("Less than one",{
          expect_that(dKumBin(2,4,0.4,0.5,-1),
          throws_error("Number of iterations cannot be less than one"))
          })
