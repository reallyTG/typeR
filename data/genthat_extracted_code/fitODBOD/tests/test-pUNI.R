context("Scenario of un wanted inputs")
test_that("NA values are avoided",{
          expect_that(pUNI(NA),
          throws_error("NA or Infinite or NAN values in the Input"))
          })
test_that("Infinite values are avoided",{
          expect_that(pUNI(Inf),
          throws_error("NA or Infinite or NAN values in the Input"))
          })
test_that("NAN values are avoided",{
          expect_that(pUNI(NaN),
          throws_error("NA or Infinite or NAN values in the Input"))
          })

context("Scenario of invalid inputs")
test_that("Greater than 1",{
          expect_that(pUNI(3),
          throws_error("Invalid values in the input"))
          })
test_that("Lesser than 1",{
          expect_that(pUNI(-3),
          throws_error("Invalid values in the input"))
          })
