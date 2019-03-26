context("mantel")

test_that("mantel r is the correlation", {
          set.seed(888)
          x <- runif(110)
          y <- runif(110)
          x <- dist(x)
          y <- dist(y)
          expect_equal(as.vector(mantel(y ~ x, nperm=0, nboot=0))[1], cor(x, y))
})
