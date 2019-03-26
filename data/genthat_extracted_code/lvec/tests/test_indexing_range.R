
context("Range indexing")

test_that("numeric vectors are correctly indexed using lget", {
  a_r <- c(-1.2, 5E10, NA, NaN, 4.1)
  a   <- as_lvec(a_r)

  # regular index
  expect_that(as_rvec(lget(a, range=c(1,4))), equals(a_r[1:4]))
  expect_that(as_rvec(lget(a, range=c(3,4))), equals(a_r[3:4]))
  expect_that(as_rvec(lget(a, range=c(3,3))), equals(a_r[3:3]))
  # invalid ranges
  expect_error(lget(a, range=c(NA, 1)))
  expect_error(lget(a, range=c(1, NA)))
  expect_error(lget(a, range=c(NA, NA)))
  expect_error(lget(a, range=numeric(0)))
  expect_error(lget(a, range=numeric(1)))
  expect_error(lget(a, range=numeric(3)))
  expect_error(lget(a, range=c(-10, 2)))
  expect_error(lget(a, range=c(3, 2)))
  expect_error(lget(a, range=c(3, 20)))
})

test_that("integer vectors are correctly indexed using lget", {
  a_r <- as.integer(c(-1, 2, 1E9, NA, 1234))
  a   <- as_lvec(a_r)

  # regular index
  expect_that(as_rvec(lget(a, range=c(1,4))), equals(a_r[1:4]))
  expect_that(as_rvec(lget(a, range=c(3,4))), equals(a_r[3:4]))
  expect_that(as_rvec(lget(a, range=c(3,3))), equals(a_r[3:3]))
  # invalid ranges
  expect_error(lget(a, range=c(NA, 1)))
  expect_error(lget(a, range=c(1, NA)))
  expect_error(lget(a, range=c(NA, NA)))
  expect_error(lget(a, range=numeric(0)))
  expect_error(lget(a, range=numeric(1)))
  expect_error(lget(a, range=numeric(3)))
  expect_error(lget(a, range=c(-10, 2)))
  expect_error(lget(a, range=c(3, 2)))
  expect_error(lget(a, range=c(3, 20)))
})

test_that("logical vectors are correctly indexed using lget", {
  a_r <- as.logical(c(TRUE, FALSE, TRUE, NA, NA))
  a   <- as_lvec(a_r)

  # regular index
  expect_that(as_rvec(lget(a, range=c(1,4))), equals(a_r[1:4]))
  expect_that(as_rvec(lget(a, range=c(3,4))), equals(a_r[3:4]))
  expect_that(as_rvec(lget(a, range=c(3,3))), equals(a_r[3:3]))
  # invalid ranges
  expect_error(lget(a, range=c(NA, 1)))
  expect_error(lget(a, range=c(1, NA)))
  expect_error(lget(a, range=c(NA, NA)))
  expect_error(lget(a, range=numeric(0)))
  expect_error(lget(a, range=numeric(1)))
  expect_error(lget(a, range=numeric(3)))
  expect_error(lget(a, range=c(-10, 2)))
  expect_error(lget(a, range=c(3, 2)))
  expect_error(lget(a, range=c(3, 20)))
})


test_that("character vectors are correctly indexed using lget", {
  a_r <- c("jan", "pier", NA, "corneel")
  a   <- as_lvec(a_r)

  # regular index
  expect_that(as_rvec(lget(a, range=c(1,4))), equals(a_r[1:4]))
  expect_that(as_rvec(lget(a, range=c(3,4))), equals(a_r[3:4]))
  expect_that(as_rvec(lget(a, range=c(3,3))), equals(a_r[3:3]))
  # invalid ranges
  expect_error(lget(a, range=c(NA, 1)))
  expect_error(lget(a, range=c(1, NA)))
  expect_error(lget(a, range=c(NA, NA)))
  expect_error(lget(a, range=numeric(0)))
  expect_error(lget(a, range=numeric(1)))
  expect_error(lget(a, range=numeric(3)))
  expect_error(lget(a, range=c(-10, 2)))
  expect_error(lget(a, range=c(3, 2)))
  expect_error(lget(a, range=c(3, 20)))
})

