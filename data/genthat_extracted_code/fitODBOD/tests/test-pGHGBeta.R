library(fitODBOD)
context("Scenario of un wanted inputs")
test_that("NA values are avoided",{
          expect_that(pGHGBeta(NA,0.1,3,3,2),
          throws_error("NA or Infinite or NAN values in the Input"))
          })
test_that("Infinite values are avoided",{
          expect_that(pGHGBeta(Inf,0.1,3,3,2),
          throws_error("NA or Infinite or NAN values in the Input"))
          })
test_that("NAN values are avoided",{
          expect_that(pGHGBeta(NaN,0.1,3,3,2),
          throws_error("NA or Infinite or NAN values in the Input"))
          })

context("Scenario of invalid inputs")
test_that("Greater than 1",{
          expect_that(pGHGBeta(5,8,3,3,2),
          throws_error("Invalid values in the input"))
          })
test_that("Lesser than 1",{
          expect_that(pGHGBeta(-3,9,3,3,2),
          throws_error("Invalid values in the input"))
          })
test_that("Lesser than zero or begin negative",{
          expect_that(pGHGBeta(3,-1,3,3,2),
          throws_error("Binomial trial value cannot be less than zero"))
          })
context("Scenario of shape parameters")
test_that("shape parameter b",{
          expect_that(pGHGBeta(0.1,5,1,-4,4),
          throws_error("Shape parameters cannot be less than or equal to zero"))
          })
test_that("shape parameter a",{
          expect_that(pGHGBeta(0.1,-5,-2,4,3),
          throws_error("Shape parameters cannot be less than or equal to zero"))
          })
test_that("shape parameter c",{
          expect_that(pGHGBeta(0.1,5,4,2,-3),
          throws_error("Shape parameters cannot be less than or equal to zero"))
          })
