context("MRM")

test_that("MRM coefficients match lm", {
          set.seed(888)
          y <- runif(11175)
          x1 <- runif(11175)
          x2 <- runif(11175)
          expect_equal(as.vector(MRM(y ~ x1 + x2, nperm=0)$coef[,1]), as.vector(coefficients(lm(y ~ x1 + x2))))
})
