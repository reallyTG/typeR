context("perturb")

test_that("perturb: use", {
  skip_on_cran()
  A <- matrix(0,ncol=3,nrow=1e5)
  start <- c(0,1,0)
  for(i in 1:1e5) {
    A[i,] <- perturb(start,1)[1:3]
  }
  x <- colMeans(A)
  expect_equal(
    x[[1]],
    0.34*0.5,
    tolerance = 0.05
  )
  expect_equal(
    x[[2]],
    1-0.34,
    tolerance = 0.05
  )
  expect_equal(
    x[[3]],
    0.34*0.5,
    tolerance = 0.05
  )
})
