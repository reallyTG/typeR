library(fitODBOD)
context("Scenario of un wanted inputs")
test_that("NA values are avoided",{
          expect_that(mazGHGBeta(NA,0.1,3,3,2),
          throws_error("NA or Infinite or NAN values in the Input"))
          })
test_that("Infinite values are avoided",{
          expect_that(mazGHGBeta(Inf,0.1,3,3,2),
          throws_error("NA or Infinite or NAN values in the Input"))
          })
test_that("NAN values are avoided",{
          expect_that(mazGHGBeta(NaN,0.1,3,3,2),
          throws_error("NA or Infinite or NAN values in the Input"))
          })

context("Moments issues")
test_that("Moments being negative or zero",{
          expect_that(mazGHGBeta(-3,3,3,3,2),
          throws_error("Moments cannot be less than or equal to zero"))
          })
context("Scenario of shape parameters")
test_that("shape parameter b",{
          expect_that(mazGHGBeta(0.1,5,1,-4,4),
          throws_error("Shape parameters cannot be less than or equal to zero"))
          })
test_that("shape parameter a",{
          expect_that(mazGHGBeta(0.1,-5,-2,4,3),
          throws_error("Shape parameters cannot be less than or equal to zero"))
          })
test_that("shape parameter c",{
          expect_that(mazGHGBeta(0.1,5,4,2,-3),
          throws_error("Shape parameters cannot be less than or equal to zero"))
          })

context("Binomial Trial value issues")
test_that("Binomial trial value issues",{
          expect_that(mazGHGBeta(3,-4,4,1,0.3),
          throws_error("Binomial trial value cannot be less than zero"))
          })
