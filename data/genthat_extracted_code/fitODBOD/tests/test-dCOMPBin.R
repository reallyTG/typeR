context ("Scenario of un wanted inputs")
test_that("NA values are avoided",{
          expect_that(dCOMPBin(NA,4,0.1,.3),
          throws_error("NA or Infinite or NAN values in the Input"))
          })
test_that("Infinite values are avoided",{
          expect_that(dCOMPBin(Inf,4,0.1,.3),
          throws_error("NA or Infinite or NAN values in the Input"))
          })
test_that("NAN values are avoided",{
          expect_that(dCOMPBin(NaN,4,0.1,.3),
          throws_error("NA or Infinite or NAN values in the Input"))
          })

context("Binomial random variable or trial value issues")
test_that("Random variable higher than Trial value",{
          expect_that(dCOMPBin(5,4,0.2,0.4),
          throws_error("Binomial random variable cannot be greater than binomial trial value"))
          })
test_that("Negativity",{
          expect_that(dCOMPBin(-3,4,0.2,0.4),
          throws_error("Binomial random variable or binomial trial value cannot be negative"))
          })
test_that("Random variable higher than Trial value",{
          expect_that(dCOMPBin(-8,-4,0.2,0.4),
          throws_error("Binomial random variable or binomial trial value cannot be negative"))
          })

context("Probability value issues")
test_that("Probability issues",{
          expect_that(dCOMPBin(3,5,3,0.4),
          throws_error("Probability value doesnot satisfy conditions"))
          })
test_that("Probability issues",{
          expect_that(dCOMPBin(3,5,-3,0.4),
          throws_error("Probability value doesnot satisfy conditions"))
          })
