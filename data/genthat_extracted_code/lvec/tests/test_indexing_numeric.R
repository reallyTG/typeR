
context("Numeric indexing")

test_that("numeric vectors are correctly indexed using lget", {
  a_r <- c(-1.2, 5E10, NA, NaN, 4.1)
  a   <- as_lvec(a_r)

  # regular index
  expect_that(as_rvec(lget(a, 1:4)), equals(a_r[1:4]))
  expect_that(as_rvec(lget(a, 3:4+0.1)), equals(a_r[3:4+0.1]))
  expect_that(as_rvec(lget(a, 3:2)), equals(a_r[3:2]))
  # index with missing values
  expect_that(as_rvec(lget(a, c(1,NA))), equals(a_r[c(1,NA)]))
  # empty index
  expect_that(as_rvec(lget(a, numeric(0))), equals(a_r[numeric(0)]))
  # out of range
  expect_error(lget(a, 20:30))
  expect_error(lget(a, -10:2))
  # overflow
  expect_error(lget(a, 1E10))
})

test_that("integer vectors are correctly indexed using lget", {
  a_r <- as.integer(c(-1, 2, 1E9, NA, 1234))
  a   <- as_lvec(a_r)

  # regular index
  expect_that(as_rvec(lget(a, 1:4)), equals(a_r[1:4]))
  expect_that(as_rvec(lget(a, 3:4+0.1)), equals(a_r[3:4+0.1]))
  expect_that(as_rvec(lget(a, 3:2)), equals(a_r[3:2]))
  # index with missing values
  expect_that(as_rvec(lget(a, c(1,NA))), equals(a_r[c(1,NA)]))
  # empty index
  expect_that(as_rvec(lget(a, numeric(0))), equals(a_r[numeric(0)]))
  # out of range
  expect_error(lget(a, 20:30))
  expect_error(lget(a, -10:2))
  # overflow
  expect_error(lget(a, 1E10))
})

test_that("logical vectors are correctly indexed using lget", {
  a_r <- as.logical(c(TRUE, FALSE, TRUE, NA, NA))
  a   <- as_lvec(a_r)

  # regular index
  expect_that(as_rvec(lget(a, 1:4)), equals(a_r[1:4]))
  expect_that(as_rvec(lget(a, 3:4+0.1)), equals(a_r[3:4+0.1]))
  expect_that(as_rvec(lget(a, 3:2)), equals(a_r[3:2]))
  # index with missing values
  expect_that(as_rvec(lget(a, c(1,NA))), equals(a_r[c(1,NA)]))
  # empty index
  expect_that(as_rvec(lget(a, numeric(0))), equals(a_r[numeric(0)]))
  # out of range
  expect_error(lget(a, 20:30))
  expect_error(lget(a, -10:2))
  # overflow
  expect_error(lget(a, 1E10))
})


test_that("character vectors are correctly indexed using lget", {
  a_r <- c("jan", "pier", NA, "corneel")
  a   <- as_lvec(a_r)

  # regular index
  expect_that(as_rvec(lget(a, 1:4)), equals(a_r[1:4]))
  expect_that(as_rvec(lget(a, 3:4+0.1)), equals(a_r[3:4+0.1]))
  expect_that(as_rvec(lget(a, 3:2)), equals(a_r[3:2]))
  # index with missing values
  expect_that(as_rvec(lget(a, c(1,NA))), equals(a_r[c(1,NA)]))
  # empty index
  expect_that(as_rvec(lget(a, numeric(0))), equals(a_r[numeric(0)]))
  # out of range
  expect_error(lget(a, 20:30))
  expect_error(lget(a, -10:2))
  # overflow
  expect_error(lget(a, 1E10))
})

