context ("Scenario of un wanted inputs")
test_that("NA values are avoided",{
          expect_that(dAddBin(NA,4,0.1,.3),
          throws_error("NA or Infinite or NAN values in the Input"))
        })
test_that("Infinite values are avoided",{
          expect_that(dAddBin(Inf,4,0.1,.3),
          throws_error("NA or Infinite or NAN values in the Input"))
        })
test_that("NAN values are avoided",{
          expect_that(dAddBin(NaN,4,0.1,.3),
          throws_error("NA or Infinite or NAN values in the Input"))
        })

context("Binomial random variable or trial value issues")
test_that("Random variable higher than Trial value",{
          expect_that(dAddBin(5,4,0.2,0.4),
          throws_error("Binomial random variable cannot be greater than binomial trial value"))
        })
test_that("Negativity",{
          expect_that(dAddBin(-3,4,0.2,0.4),
          throws_error("Binomial random variable or binomial trial value cannot be negative"))
        })
test_that("Random variable higher than Trial value",{
          expect_that(dAddBin(-8,-4,0.2,0.4),
          throws_error("Binomial random variable or binomial trial value cannot be negative"))
        })

context("Alpha or probability value issues")
test_that("Probability issues",{
          expect_that(dAddBin(3,5,3,0.4),
          throws_error("Probability or alpha value doesnot satisfy conditions"))
          })
test_that("Probability issues",{
          expect_that(dAddBin(3,5,-3,0.4),
          throws_error("Probability or alpha value doesnot satisfy conditions"))
          })
test_that("Probability issues",{
          expect_that(dAddBin(3,5,0.3,-4),
          throws_error("Probability or alpha value doesnot satisfy conditions"))
          })
test_that("Probability issues",{
          expect_that(dAddBin(3,5,0.3,4),
          throws_error("Probability or alpha value doesnot satisfy conditions"))
          })

context("Alpha value issues")
test_that("Alpha being greater than right side",{
          expect_that(dAddBin(1,10,0.2,0.4),
          throws_error("alpha parameter doesnot satisfy the conditions"))
          })

test_that("Alpha being lesser than left side",{
          expect_that(dAddBin(1,10,0.2,-0.4),
          throws_error("alpha parameter doesnot satisfy the conditions"))
          })
