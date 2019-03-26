context("split_matrix test")

test_that("split_matrix works properly", {


  mat <- matrix(1:12, ncol=2)
  a <- split_matrix(mat, 4, shuffle=FALSE)
  expect_is(a, "list")
  expect_equal(length(a), 2)
  expect_equal(dim(a[[1]]), c(4, 2))
  expect_equal(dim(a[[2]]), c(2, 2))
  expect_equal(c(a[[1]]), c(1:4,7:10))
  expect_equal(c(a[[2]]), c(5,6,11,12))

  set.seed(0)
  b <- split_matrix(mat, 4, shuffle=TRUE)
  expect_is(b, "list")
  expect_equal(length(b), 2)
  expect_equal(dim(b[[1]]), c(2, 2))
  expect_equal(dim(b[[2]]), c(4, 2))
  expect_equal(c(b[[2]]), c(1:4,7:10))
  expect_equal(c(b[[1]]), c(5,6,11,12))


  d <- split_matrix(mat, nsplits=3, shuffle=FALSE) # same as 4 rowspergroup
  expect_is(d, "list")
  expect_equal(length(d), 3)
  expect_equal(dim(d[[1]]), c(2, 2))
  expect_equal(dim(d[[2]]), c(2, 2))
  expect_equal(dim(d[[3]]), c(2, 2))
  expect_equal(c(d[[1]]), c(1,2,7,8))
  expect_equal(c(d[[2]]), c(3,4,9,10))
  expect_equal(c(d[[3]]), c(5,6,11,12))

  e <- split_matrix(mat, rowspergroup = 4, shuffle=FALSE)
  expect_equal(a, e)

  f <- split_matrix(mat, rowspergroup = 2, shuffle=FALSE)
  expect_equal(d, f)
})
