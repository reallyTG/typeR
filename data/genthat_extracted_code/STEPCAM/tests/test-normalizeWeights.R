context("normalizeWeights")

test_that("normalizeWeights: use", {
  skip_on_cran()
  A <- rep(1,5)
  v <- normalizeWeights(A)
  expect_equal(
    sum(v),1
  )
  expect_equal(v[1],0.2)

  A <- c(A,1e6)
  v <- normalizeWeights(A)
  expect_equal(sum(v),1)
  expect_equal(v[6],1,tolerance=1e-4)
})
