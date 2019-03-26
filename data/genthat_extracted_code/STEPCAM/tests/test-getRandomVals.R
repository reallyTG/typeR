context("getRandomVals")

test_that("getRandomVals: use", {
  skip_on_cran()
  A <- matrix(0,ncol=3,nrow=1e5)
  for(i in 1:1e5) {
    A[i,] <- getRandomVals(100)
  }
  x <- colMeans(A)
  expect_equal(
    x[[1]],
    33,
    tolerance = 0.1
  )
  expect_equal(
    x[[2]],
    33,
    tolerance = 0.1
  )
  expect_equal(
    x[[3]],
    33,
    tolerance = 0.1
  )
})

