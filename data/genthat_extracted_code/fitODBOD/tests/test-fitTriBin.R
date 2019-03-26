context("Scenario of un wanted inputs")
test_that("NA values are avoided",{
          expect_that(fitTriBin(0:7,c(47,54,43,40,40,41,39,95),NA),
          throws_error("NA or Infinite or NAN values in the Input"))
          })
test_that("Infinite values are avoided",{
          expect_that(fitTriBin(0:7,c(47,54,43,40,40,41,39,95),Inf),
          throws_error("NA or Infinite or NAN values in the Input"))
          })
test_that("NAN values are avoided",{
          expect_that(fitTriBin(0:7,c(47,54,43,40,40,41,39,95),NaN),
          throws_error("NA or Infinite or NAN values in the Input"))
          })

context("Chi-squared issues")
test_that("Chi-squared approximation issues",{
          expect_that(fitTriBin(200:203,c(1,1,1,1),0.000000009),
          gives_warning("Chi-squared approximation is not suitable because expected frequency approximates to zero"))
          })
test_that("Chi-squared approximation issues",{
          expect_that(fitTriBin(0:6,c(2,5,40,40,4,3),0.00000001),
          gives_warning("Chi-squared approximation may be doubtful because expected frequency is less than 5"))
          })

context("Degree of Freedom")
test_that("Degree of freedom less than zero",{
          expect_that(fitTriBin(1,2,0.1),
          gives_warning("Degrees of freedom cannot be less than or equal to zero"))
          })
test_that("Degree of freedom equal to zero",{
          expect_that(fitTriBin(c(0,1),c(11,12),0.1),
          gives_warning("Degrees of freedom cannot be less than or equal to zero"))
          })
