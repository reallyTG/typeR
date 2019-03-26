context("Scenario of un wanted inputs")
test_that("NA values are avoided",{
          expect_that(dBETA(NA,0.1,3),
          throws_error("NA or Infinite or NAN values in the Input"))
          })
test_that("Infinite values are avoided",{
          expect_that(dBETA(Inf,0.1,3),
          throws_error("NA or Infinite or NAN values in the Input"))
          })
test_that("NAN values are avoided",{
          expect_that(dBETA(NaN,0.1,3),
          throws_error("NA or Infinite or NAN values in the Input"))
          })

context("Scenario of invalid inputs")
test_that("Greater than 1",{
          expect_that(dBETA(3,0.1,3),
          throws_error("Invalid values in the input"))
          })
test_that("Lesser than 1",{
          expect_that(dBETA(-3,0.1,3),
          throws_error("Invalid values in the input"))
          })

context("Scenario of shape parameters")
test_that("shape parameter b",{
          expect_that(dBETA(0.1,5,-4),
          throws_error("Shape parameters cannot be less than or equal to zero"))
          })
test_that("shape parameter a",{
          expect_that(dBETA(0.1,-5,4),
          throws_error("Shape parameters cannot be less than or equal to zero"))
          })
