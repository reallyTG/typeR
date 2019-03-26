context("Scenario of un wanted inputs")
test_that("NA values are avoided",{
          expect_that(pTRI(NA,0.1),
          throws_error("NA or Infinite or NAN values in the Input"))
          })
test_that("Infinite values are avoided",{
          expect_that(pTRI(Inf,0.1),
          throws_error("NA or Infinite or NAN values in the Input"))
          })
test_that("NAN values are avoided",{
          expect_that(pTRI(NaN,0.1),
          throws_error("NA or Infinite or NAN values in the Input"))
          })

context("Scenario of invalid inputs")
test_that("Greater than 1",{
          expect_that(pTRI(3,0.1),
          throws_error("Invalid values in the input"))
          })
test_that("Lesser than 1",{
          expect_that(pTRI(-3,0.1),
          throws_error("Invalid values in the input"))
          })

context("Scenario of mode")
test_that("Mode out of range",{
          expect_that(pTRI(0.1,5),
          throws_error("Mode cannot be less than zero or greater than one"))
          })
test_that("Mode out of range",{
          expect_that(pTRI(0.1,-5),
          throws_error("Mode cannot be less than zero or greater than one"))
          })
