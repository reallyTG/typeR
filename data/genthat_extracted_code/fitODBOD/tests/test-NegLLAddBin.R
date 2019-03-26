context ("Scenario of un wanted inputs")
test_that("NA values are avoided",{
          expect_that(NegLLAddBin(NA,4,0.1,.3),
          throws_error("NA or Infinite or NAN values in the Input"))
          })
test_that("Infinite values are avoided",{
          expect_that(NegLLAddBin(Inf,4,0.1,.3),
          throws_error("NA or Infinite or NAN values in the Input"))
          })
test_that("NAN values are avoided",{
          expect_that(NegLLAddBin(NaN,4,0.1,.3),
          throws_error("NA or Infinite or NAN values in the Input"))
          })

context("Binomial Random variable or frequency issues")
test_that("Negativity Binomial random variable",{
          expect_that(NegLLAddBin(-3,4,0.2,0.4),
          throws_error("Binomial random variable or frequency values cannot be negative"))
          })
test_that("Negativity frequency values",{
          expect_that(NegLLAddBin(-3,4,0.2,0.4),
          throws_error("Binomial random variable or frequency values cannot be negative"))
          })

context("Alpha or probability value issues")
test_that("Probability issues",{
          expect_that(NegLLAddBin(3,5,3,0.4),
          throws_error("Probability or alpha value doesnot satisfy conditions"))
          })
test_that("Probability issues",{
          expect_that(NegLLAddBin(3,5,-3,0.4),
          throws_error("Probability or alpha value doesnot satisfy conditions"))
          })
test_that("Probability issues",{
          expect_that(NegLLAddBin(3,5,0.3,-4),
          throws_error("Probability or alpha value doesnot satisfy conditions"))
          })
test_that("Probability issues",{
          expect_that(NegLLAddBin(3,5,0.3,4),
          throws_error("Probability or alpha value doesnot satisfy conditions"))
          })

context("Alpha value issues")
test_that("Alpha value greater than right side",{
          expect_that(NegLLAddBin(5,1,0.2,0.4),
          throws_error("alpha parameter doesnot satisfy the conditions"))
          })
test_that("Alpha value greater than left side",{
          expect_that(NegLLAddBin(5,1,0.2,-0.4),
          throws_error("alpha parameter doesnot satisfy the conditions"))
          })
