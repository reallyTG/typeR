library(sBIC)

context("Testing Factor Analyses")

# TODO: More tests!

test_that("Learning coefficients are correct", {
  facModels = FactorAnalyses(6, 3)
  trueLearningCoefs = matrix(c(3,0,0,0,
                               9/2,6,0,0,
                               6,29/4,17/2,0,
                               15/2,17/2,19/2,21/2), ncol = 4, byrow = T)
  for (i in 1:4) {
    for (j in 1:i) {
      expect_equal(facModels$learnCoef(i, j)$lambda, trueLearningCoefs[i, j])
      expect_equal(facModels$learnCoef(i, j)$m, 1)
    }
  }
})