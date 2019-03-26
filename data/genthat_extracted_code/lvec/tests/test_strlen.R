
context("Get and set string length")

test_that("getting strlen works", {
  a <- as_lvec("123")
  expect_that(strlen(a), equals(3))

  a <- as_lvec("")
  expect_that(strlen(a), equals(2))

  a <- lvec(1, type = "character", strlen = 5)
  expect_that(strlen(a), equals(5))

  a <- lvec(1, type = "character", strlen = 1)
  expect_that(strlen(a), equals(2))

  a <- lvec(1, type = "character", strlen = 0)
  expect_that(strlen(a), equals(2))
})

test_that("setting strlen works", {
  a <- as_lvec("123")
  strlen(a) <- 6

  expect_that(strlen(a), equals(6))
  expect_that(as_rvec(lget(a, 1)), equals("123"))

  lset(a, 1, "123456")
  expect_that(as_rvec(lget(a, 1)), equals("123456"))

  strlen(a) <- 1
  expect_that(strlen(a), equals(2))
  expect_that(as_rvec(lget(a, 1)), equals("12"))

  expect_error(strlen(a) <- NA)
  expect_error(strlen(a) <- -10)
})

