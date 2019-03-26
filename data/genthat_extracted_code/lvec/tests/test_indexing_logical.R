
context("Logical indexing")

test_that("numeric vectors are correctly indexed using lget", {
  a_r <- c(-1.2, 5E10, NA, NaN, 4.1)
  a   <- as_lvec(a_r)

  # regular index
  expect_that(as_rvec(lget(a, c(TRUE, FALSE, FALSE, TRUE))), equals(a_r[c(TRUE, FALSE, FALSE, TRUE)]))
  expect_that(as_rvec(lget(a, c(FALSE, TRUE))), equals(a_r[c(FALSE, TRUE)]))
  expect_that(as_rvec(lget(a, c(TRUE))), equals(a_r[c(TRUE)]))
  expect_that(as_rvec(lget(a, c(FALSE))), equals(a_r[c(FALSE)]))
  # index with missing values
  expect_that(as_rvec(lget(a, c(TRUE, NA, FALSE, TRUE))), equals(a_r[c(TRUE, NA, FALSE, TRUE)]))
  # empty index
  expect_that(as_rvec(lget(a, logical(0))), equals(a_r[logical(0)]))
})

test_that("integer vectors are correctly indexed using lget", {
  a_r <- as.integer(c(-1, 2, 1E9, NA, 1234))
  a   <- as_lvec(a_r)

  # regular index
  expect_that(as_rvec(lget(a, c(TRUE, FALSE, FALSE, TRUE))), equals(a_r[c(TRUE, FALSE, FALSE, TRUE)]))
  expect_that(as_rvec(lget(a, c(FALSE, TRUE))), equals(a_r[c(FALSE, TRUE)]))
  expect_that(as_rvec(lget(a, c(TRUE))), equals(a_r[c(TRUE)]))
  expect_that(as_rvec(lget(a, c(FALSE))), equals(a_r[c(FALSE)]))
  # index with missing values
  expect_that(as_rvec(lget(a, c(TRUE, NA, FALSE, TRUE))), equals(a_r[c(TRUE, NA, FALSE, TRUE)]))
  # empty index
  expect_that(as_rvec(lget(a, logical(0))), equals(a_r[logical(0)]))
})

test_that("logical vectors are correctly indexed using lget", {
  a_r <- as.logical(c(TRUE, FALSE, TRUE, NA, NA))
  a   <- as_lvec(a_r)

  # regular index
  expect_that(as_rvec(lget(a, c(TRUE, FALSE, FALSE, TRUE))), equals(a_r[c(TRUE, FALSE, FALSE, TRUE)]))
  expect_that(as_rvec(lget(a, c(FALSE, TRUE))), equals(a_r[c(FALSE, TRUE)]))
  expect_that(as_rvec(lget(a, c(TRUE))), equals(a_r[c(TRUE)]))
  expect_that(as_rvec(lget(a, c(FALSE))), equals(a_r[c(FALSE)]))
  # index with missing values
  expect_that(as_rvec(lget(a, c(TRUE, NA, FALSE, TRUE))), equals(a_r[c(TRUE, NA, FALSE, TRUE)]))
  # empty index
  expect_that(as_rvec(lget(a, logical(0))), equals(a_r[logical(0)]))
})


test_that("character vectors are correctly indexed using lget", {
  a_r <- c("jan", "pier", NA, "corneel")
  a   <- as_lvec(a_r)

  # regular index
  expect_that(as_rvec(lget(a, c(TRUE, FALSE, FALSE, TRUE))), equals(a_r[c(TRUE, FALSE, FALSE, TRUE)]))
  expect_that(as_rvec(lget(a, c(FALSE, TRUE))), equals(a_r[c(FALSE, TRUE)]))
  expect_that(as_rvec(lget(a, c(TRUE))), equals(a_r[c(TRUE)]))
  expect_that(as_rvec(lget(a, c(FALSE))), equals(a_r[c(FALSE)]))
  # index with missing values
  expect_that(as_rvec(lget(a, c(TRUE, NA, FALSE, TRUE))), equals(a_r[c(TRUE, NA, FALSE, TRUE)]))
  # empty index
  expect_that(as_rvec(lget(a, logical(0))), equals(a_r[logical(0)]))
})

