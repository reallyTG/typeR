context ("Scenario of un wanted inputs")
test_that("NA values are avoided",{
          expect_that(dTriBin(NA,4,0.1),
          throws_error("NA or Infinite or NAN values in the Input"))
          })
test_that("Infinite values are avoided",{
          expect_that(dTriBin(Inf,4,0.1),
          throws_error("NA or Infinite or NAN values in the Input"))
          })
test_that("NAN values are avoided",{
          expect_that(dTriBin(NaN,4,0.1),
          throws_error("NA or Infinite or NAN values in the Input"))
          })

context("Mode issues")
test_that("Greater than 1",{
          expect_that(dTriBin(2,4,3),
          throws_error("Mode cannot be less than or equal to zero or greater than or equal to one"))
          })
test_that("Lesser than 0",{
          expect_that(dTriBin(2,4,-3),
          throws_error("Mode cannot be less than or equal to zero or greater than or equal to one"))
          })

context("Binomial random variable or trial value issues")
test_that("Random variable higher than Trial value",{
          expect_that(dTriBin(5,4,0.2),
          throws_error("Binomial random variable cannot be greater than binomial trial value"))
          })
test_that("Negativity",{
          expect_that(dTriBin(-3,4,0.2),
          throws_error("Binomial random variable or binomial trial value cannot be negative"))
          })
test_that("Random variable higher than Trial value",{
          expect_that(dTriBin(-8,-4,0.2),
          throws_error("Binomial random variable or binomial trial value cannot be negative"))
          })
