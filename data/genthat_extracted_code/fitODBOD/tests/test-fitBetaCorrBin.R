context("Scenario of un wanted inputs")
test_that("NA values are avoided",{
        expect_that(fitBetaCorrBin(0:7,c(47,54,43,40,40,41,39,95),NA,0.003,1),
        throws_error("NA or Infinite or NAN values in the Input"))
        })
test_that("Infinite values are avoided",{
        expect_that(fitBetaCorrBin(0:7,c(47,54,43,40,40,41,39,95),Inf,0.003,1),
        throws_error("NA or Infinite or NAN values in the Input"))
        })
test_that("NAN values are avoided",{
        expect_that(fitBetaCorrBin(0:7,c(47,54,43,40,40,41,39,95),NaN,0.003,1),
        throws_error("NA or Infinite or NAN values in the Input"))
        })

context("Chi-squared issues")
test_that("Chi-squared approximation issues",{
        expect_that(fitBetaCorrBin(0:7,c(7,3,3,4,4,4,5,4),0.030,34.3,5.9),
        gives_warning("Chi-squared approximation is not suitable because expected frequency approximates to zero"))
        })
test_that("Chi-squared approximation issues",{
        expect_that(fitBetaCorrBin(0:7,c(47,54,43,40,40,41,39,95),0.01,30,10),
        gives_warning("Chi-squared approximation may be doubtful because expected frequency is less than 5"))
        })

context("Degree of Freedom")
test_that("Degree of freedom less than zero",{
        expect_that(fitBetaCorrBin(1,2,0.003,0.1,0.03),
        gives_warning("Degrees of freedom cannot be less than or equal to zero"))
        })
test_that("Degree of freedom equal to zero",{
        expect_that(fitBetaCorrBin(c(0,1,2,3),c(10,11,12,12),0.003,0.1,0.03),
        gives_warning("Degrees of freedom cannot be less than or equal to zero"))
        })
