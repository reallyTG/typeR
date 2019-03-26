
context("Get and set length of lvec")

test_that("getting of length works", {
  a <- as_lvec(1:4)
  expect_that(length(a), equals(4))

  a <- lvec(0, "integer")
  expect_that(length(a), equals(0))

  a <- as_lvec(as.numeric(1:4))
  expect_that(length(a), equals(4))

  a <- lvec(0, "numeric")
  expect_that(length(a), equals(0))

  a <- as_lvec(c(TRUE, FALSE, TRUE, TRUE))
  expect_that(length(a), equals(4))

  a <- lvec(0, "logical")
  expect_that(length(a), equals(0))

  a <- as_lvec(c("jan", "pier", "tjorres", "corneel"))
  expect_that(length(a), equals(4))

  a <- lvec(0, "character", strlen=4)
  expect_that(length(a), equals(0))
})

test_that("setting of length works", {
  a <- as_lvec(1:4)
  length(a) <- 5
  expect_that(as_rvec(a), equals(c(1:4, 0)))
  length(a) <- 2
  expect_that(as_rvec(a), equals(1:2))
  length(a) <- 0
  expect_that(as_rvec(a), equals(integer(0)))

  a <- as_lvec(1:4+0.3)
  length(a) <- 5
  expect_that(as_rvec(a), equals(c(1:4+0.3, 0.0)))
  length(a) <- 2
  expect_that(as_rvec(a), equals(1:2+0.3))
  length(a) <- 0
  expect_that(as_rvec(a), equals(numeric(0)))

  a <- as_lvec(c(TRUE, FALSE, TRUE, TRUE))
  length(a) <- 5
  expect_that(as_rvec(a), equals(c(TRUE, FALSE, TRUE, TRUE, FALSE)))
  length(a) <- 2
  expect_that(as_rvec(a), equals(c(TRUE, FALSE)))
  length(a) <- 0
  expect_that(as_rvec(a), equals(logical(0)))

  a <- as_lvec(letters[1:4])
  length(a) <- 5
  expect_that(as_rvec(a), equals(c(letters[1:4], "")))
  length(a) <- 2
  expect_that(as_rvec(a), equals(letters[1:2]))
  length(a) <- 0
  expect_that(as_rvec(a), equals(character(0)))
})

