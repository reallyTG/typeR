context("Scenario of un wanted inputs")
test_that("NA values are avoided",{
          expect_that(fitBin(0:7,c(47,54,43,40,40,41,39,95),NA,F),
          throws_error("NA or Infinite or NAN values in the Input"))
        })
test_that("Infinite values are avoided",{
          expect_that(fitBin(0:7,c(47,54,43,40,40,41,39,95),Inf,F),
          throws_error("NA or Infinite or NAN values in the Input"))
        })
test_that("NAN values are avoided",{
          expect_that(fitBin(0:7,c(47,54,43,40,40,41,39,95),NaN,F),
          throws_error("NA or Infinite or NAN values in the Input"))
        })

context("Chi-squared issues")
test_that("Chi-squared approximation issues",{
        expect_that(fitBin(0:7,c(47,54,43,40,40,41,39,95),0.003),
        gives_warning("Chi-squared approximation is not suitable because expected frequency approximates to zero"))
        })

context("Degree of Freedom")
test_that("Degree of freedom less than zero",{
        expect_that(fitBin(1,2),
        gives_warning("Degrees of freedom cannot be less than or equal to zero"))
        })
test_that("Degree of freedom equal to zero",{
        expect_that(fitBin(c(0,1),c(11,12)),
        gives_warning("Degrees of freedom cannot be less than or equal to zero"))
        })
