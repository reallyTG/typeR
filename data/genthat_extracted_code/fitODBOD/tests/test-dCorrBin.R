context ("Scenario of un wanted inputs")
test_that("NA values are avoided",{
          expect_that(dCorrBin(NA,4,0.1,.3),
          throws_error("NA or Infinite or NAN values in the Input"))
        })
test_that("Infinite values are avoided",{
          expect_that(dCorrBin(Inf,4,0.1,.3),
          throws_error("NA or Infinite or NAN values in the Input"))
        })
test_that("NAN values are avoided",{
          expect_that(dCorrBin(NaN,4,0.1,.3),
          throws_error("NA or Infinite or NAN values in the Input"))
        })

context("Binomial random variable or trial value issues")
test_that("Random variable higher than Trial value",{
          expect_that(dCorrBin(5,4,0.2,0.4),
          throws_error("Binomial random variable cannot be greater than binomial trial value"))
          })
test_that("Negativity",{
          expect_that(dCorrBin(-3,4,0.2,0.4),
          throws_error("Binomial random variable or binomial trial value cannot be negative"))
})
test_that("Random variable higher than Trial value",{
          expect_that(dCorrBin(-8,-4,0.2,0.4),
          throws_error("Binomial random variable or binomial trial value cannot be negative"))
})

context("Probability value issues")
test_that("Probability issues",{
  expect_that(dCorrBin(3,5,3,0.4),
              throws_error("Probability value doesnot satisfy conditions"))
})
test_that("Probability issues",{
  expect_that(dCorrBin(3,5,-3,0.4),
              throws_error("Probability value doesnot satisfy conditions"))
})

context("Correlation limitations")
test_that("Correlation above maximum limit",{
  expect_that(dCorrBin(3,5,0.2,19),
              throws_error("Correlation cannot be greater than 1 or Lesser than -1 or it cannot be greater than Maximum Correlation or Lesser than Minimum Correlation"))
})
test_that("Correlation above 1",{
  expect_that(dCorrBin(3,5,0.2,9),
              throws_error("Correlation cannot be greater than 1 or Lesser than -1 or it cannot be greater than Maximum Correlation or Lesser than Minimum Correlation"))
})
test_that("Correlation below minimum limit",{
  expect_that(dCorrBin(3,5,0.2,-19),
              throws_error("Correlation cannot be greater than 1 or Lesser than -1 or it cannot be greater than Maximum Correlation or Lesser than Minimum Correlation"))
})
test_that("Correlation below -1",{
  expect_that(dCorrBin(3,5,0.2,-9),
              throws_error("Correlation cannot be greater than 1 or Lesser than -1 or it cannot be greater than Maximum Correlation or Lesser than Minimum Correlation"))
})
