context("Scenario of un wanted inputs")
test_that("NA values are avoided",{
          expect_that(mazUNI(NA),
          throws_error("NA or Infinite or NAN values in the Input"))
          })
test_that("Infinite values are avoided",{
          expect_that(mazUNI(Inf),
          throws_error("NA or Infinite or NAN values in the Input"))
          })
test_that("NAN values are avoided",{
          expect_that(mazUNI(NaN),
          throws_error("NA or Infinite or NAN values in the Input"))
          })

context("Moments issues")
test_that("Moments being negative or zero",{
          expect_that(mazUNI(-3),
          throws_error("Moments cannot be less than or equal to zero"))
          })
