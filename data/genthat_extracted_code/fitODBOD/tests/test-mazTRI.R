context("Scenario of un wanted inputs")
test_that("NA values are avoided",{
          expect_that(mazTRI(NA,0.1),
          throws_error("NA or Infinite or NAN values in the Input"))
          })
test_that("Infinite values are avoided",{
          expect_that(mazTRI(Inf,0.1),
          throws_error("NA or Infinite or NAN values in the Input"))
          })
test_that("NAN values are avoided",{
          expect_that(mazTRI(NaN,0.1),
          throws_error("NA or Infinite or NAN values in the Input"))
          })

context("Scenario of mode")
test_that("Mode out of range",{
          expect_that(mazTRI(1,5),
          throws_error("Mode cannot be less than zero or greater than one"))
          })
test_that("Mode out of range",{
          expect_that(mazTRI(1,-5),
          throws_error("Mode cannot be less than zero or greater than one"))
          })

context("Moments issues")
test_that("Moments being negative or zero",{
          expect_that(mazTRI(-3,0.3),
          throws_error("Moments cannot be less than or equal to zero"))
          })
