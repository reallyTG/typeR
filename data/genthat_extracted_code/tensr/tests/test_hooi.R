context("hooi")

test_that("rank 0 hooi is just a tensor of zeros", {
  set.seed(1)
  p <- c(11, 13, 17)
  Y <- array(stats::rnorm(prod(p)), dim = p)
  hy <- hooi(X = Y, r = c(0, 5, 6))
  expect_true(all(hy$G == 0))
  expect_true(all(atrans(hy$G, hy$U) == 0))
}
)

test_that("rank 1 hooi returns matrices", {
  set.seed(1)
  p <- c(11, 13, 17)
  Y <- array(stats::rnorm(prod(p)), dim = p)
  trash <- capture.output(hy <- hooi(X = Y, r = c(1, 2, 1), print_fnorm = TRUE))
  expect_true(is.matrix(hy$U[[1]]))
  expect_true(is.matrix(hy$U[[3]]))
})


test_that("full rank hooi returns hosvd", {
  set.seed(1)
  p <- c(11, 13, 17)
  Y <- array(stats::rnorm(prod(p)), dim = p)
  hy <- hooi(X = Y, r = p)
  hoy <- hosvd(Y = Y, r = p)
  expect_true(all(abs(hoy$S) - abs(hy$G) < 10 ^ -10))
  expect_true(all(abs(hoy$U[[1]]) - abs(hy$U[[1]]) < 10 ^ -10))
  expect_true(all(abs(hoy$U[[2]]) - abs(hy$U[[2]]) < 10 ^ -10))
  expect_true(all(abs(hoy$U[[3]]) - abs(hy$U[[3]]) < 10 ^ -10))
})
