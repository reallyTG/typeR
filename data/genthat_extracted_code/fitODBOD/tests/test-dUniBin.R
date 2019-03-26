context ("Scenario of un wanted inputs")
test_that("NA values are avoided",{
          expect_that(dUniBin(NA,4),
          throws_error("NA or Infinite or NAN values in the Input"))
          })
test_that("Infinite values are avoided",{
          expect_that(dUniBin(Inf,4),
          throws_error("NA or Infinite or NAN values in the Input"))
          })
test_that("NAN values are avoided",{
          expect_that(dUniBin(NaN,4),
          throws_error("NA or Infinite or NAN values in the Input"))
          })

context("Binomial random variable or trial value issues")
test_that("Random variable higher than Trial value",{
          expect_that(dUniBin(5,4),
          throws_error("Binomial random variable cannot be greater than binomial trial value"))
          })
test_that("Negativity",{
          expect_that(dUniBin(-3,4),
          throws_error("Binomial random variable or binomial trial value cannot be negative"))
          })
test_that("Random variable higher than Trial value",{
          expect_that(dUniBin(-8,-4),
          throws_error("Binomial random variable or binomial trial value cannot be negative"))
          })
