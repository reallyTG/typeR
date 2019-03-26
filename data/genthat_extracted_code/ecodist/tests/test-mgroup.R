context("mgroup")

test_that("Mantel r is correct", {
          set.seed(888)
          x <- runif(110)
          groups.char <- sample(letters[1:5], size=length(x), replace=TRUE)

          x.d <- dist(x)

          groups.factor <- factor(groups.char)
          groups.numeric <- as.numeric(groups.factor)

          groups.d <- dist(groups.numeric)
          groups.d[groups.d > 0] <- 1

          expect_equal(as.vector(mantel(x.d ~ groups.d, nperm=0, nboot=0))[1], mgroup(x.d, groups.char, nperm=0)[1, 2])
          expect_equal(as.vector(mantel(x.d ~ groups.d, nperm=0, nboot=0))[1], mgroup(x.d, groups.factor, nperm=0)[1, 2])
          expect_equal(as.vector(mantel(x.d ~ groups.d, nperm=0, nboot=0))[1], mgroup(x.d, groups.numeric, nperm=0)[1, 2])

})

