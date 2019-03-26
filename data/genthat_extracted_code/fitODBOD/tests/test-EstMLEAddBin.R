context("Scenario of un wanted inputs")
test_that("NA values are avoided",{
          expect_that(EstMLEAddBin(NA,4),
          throws_error("NA or Infinite or NAN values in the Input"))
          })
test_that("NAN values are avoided",{
          expect_that(EstMLEAddBin(NaN,4),
          throws_error("NA or Infinite or NAN values in the Input"))
          })
test_that("Infinite values are avoided",{
          expect_that(EstMLEAddBin(Inf,4),
          throws_error("NA or Infinite or NAN values in the Input"))
          })
