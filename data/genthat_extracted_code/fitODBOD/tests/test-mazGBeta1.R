context("Scenario of un wanted inputs")
test_that("NA values are avoided",{
          expect_that(mazGBeta1(NA,0.1,3,3),
          throws_error("NA or Infinite or NAN values in the Input"))
          })
test_that("Infinite values are avoided",{
          expect_that(mazGBeta1(Inf,0.1,3,3),
          throws_error("NA or Infinite or NAN values in the Input"))
          })
test_that("NAN values are avoided",{
          expect_that(mazGBeta1(NaN,0.1,3,3),
          throws_error("NA or Infinite or NAN values in the Input"))
          })

context("Moments issues")
test_that("Moments being negative or zero",{
          expect_that(mazGBeta1(-3,3,3,2),
          throws_error("Moments cannot be less than or equal to zero"))
          })
context("Scenario of shape parameters")
test_that("shape parameter b",{
        expect_that(mazGBeta1(0.1,5,-4,4),
        throws_error("Shape parameters cannot be less than or equal to zero"))
        })
test_that("shape parameter a",{
        expect_that(mazGBeta1(1,-2,4,3),
        throws_error("Shape parameters cannot be less than or equal to zero"))
        })
test_that("shape parameter c",{
        expect_that(mazGBeta1(0.1,5,2,-3),
        throws_error("Shape parameters cannot be less than or equal to zero"))
        })
