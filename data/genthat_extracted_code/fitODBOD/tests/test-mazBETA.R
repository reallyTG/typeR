context("Scenario of un wanted inputs")
test_that("NA values are avoided",{
          expect_that(mazBETA(NA,0.1,2),
          throws_error("NA or Infinite or NAN values in the Input"))
          })
test_that("Infinite values are avoided",{
          expect_that(mazBETA(Inf,0.1,3),
          throws_error("NA or Infinite or NAN values in the Input"))
          })
test_that("NAN values are avoided",{
          expect_that(mazBETA(NaN,0.1,4),
          throws_error("NA or Infinite or NAN values in the Input"))
          })

context("Scenario of shape parameters")
test_that("shape parameter b",{
          expect_that(mazBETA(1,5,-4),
          throws_error("Shape parameters cannot be less than or equal to zero"))
          })
test_that("shape parameter a",{
          expect_that(mazBETA(1,-5,4),
          throws_error("Shape parameters cannot be less than or equal to zero"))
          })

context("Moments issues")
test_that("Moments being negative or zero",{
          expect_that(mazBETA(-3,0.3,4),
          throws_error("Moments cannot be less than or equal to zero"))
          })
