context("Scenario of un wanted inputs")
test_that("NA values are avoided",{
          expect_that(EstMGFBetaBin(0:7,c(47,54,43,40,40,41,NA,95)),
          throws_error("NA or Infinite or NAN values in the Input"))
          })
test_that("Infinite values are avoided",{
          expect_that(EstMGFBetaBin(0:7,c(47,54,43,40,40,Inf,39,95)),
          throws_error("NA or Infinite or NAN values in the Input"))
          })
test_that("NAN values are avoided",{
          expect_that(EstMGFBetaBin(0:7,c(47,54,43,40,40,NaN,39,95)),
          throws_error("NA or Infinite or NAN values in the Input"))
          })
