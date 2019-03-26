
context("Indexing")

test_that("indexing works", {
  x <- as_lvec(1:10)
  x_r <- as_rvec(x)

  x[4] <- 99
  x_r[4] <- 99
  expect_that(as_rvec(x), equals(x_r))
  expect_that(as_rvec(x[c(3,4)]), equals(x_r[c(3,4)]))
  expect_that(as_rvec(x[TRUE]), equals(x_r[TRUE]))

  x[1:4] <- 109
  x_r[1:4] <- 109
  expect_that(as_rvec(x), equals(x_r))
  expect_that(as_rvec(x[4]), equals(x_r[4]))
  expect_that(as_rvec(x[NA]), equals(x_r[NA]))

  x[range = c(3,6)] <- 299
  x_r[3:6] <- 299
  expect_that(as_rvec(x), equals(x_r))
  expect_that(as_rvec(x[range = c(2,3)]), equals(x_r[c(2,3)]))
})

