
context("Assignment using numeric index")

test_assignment <- function(a_r, index, values) {
  a <- as_lvec(a_r)
  lset(a, index, values)
  suppressWarnings({ a_r[index] <- values })
  expect_that(as_rvec(a), equals(a_r))
}

test_that("numeric vectors are assigned using lset", {
  a_r <- c(-1.2, 5E10, NA, NaN, 4.1)
  a   <- as_lvec(a_r)

  test_assignment(a_r, 1:4, 11:14)
  test_assignment(a_r, c(4, 1, 3, 2), 11:14)
  # values shorter than index
  test_assignment(a_r, 1:4, 11:12)
  test_assignment(a_r, 1:4, 11:13)
  test_assignment(a_r, 1:4, 33)
  # NA's
  test_assignment(a_r, 1:4, c(NA, NA, NA))
  expect_error(lset(a, c(NA, 3), 1:2))
  # Inf
  test_assignment(a_r, 1, Inf)
  test_assignment(a_r, 3, -Inf)
  # empty index
  test_assignment(a_r, numeric(0), numeric(0))
  # empty values
  expect_error(lset(a, 1:4, numeric(0)))
  # out of range
  expect_error(lset(a, 20:30, 11))
  expect_error(lset(a, 3:9, 11))
  expect_error(lset(a, -10:1, 11))
  expect_error(lset(a, 0:1, 11))
  # overflow
  expect_error(lset(a, 1E10, 11))
  # numeric indeices
  test_assignment(a_r, 1:5+0.1, 1:5)

  # regression tests
  # 1. following gave conversion error: fixed 2016-12-21
  a <- lvec(1, type = "numeric")
  lset(a, index = 1.0, value = 0.0)
})

test_that("integer vectors are assigned using lset", {
  a_r <- as.integer(c(-1, 2, 1E9, NA, 1234))
  a   <- as_lvec(a_r)

  test_assignment(a_r, 1:4, 11:14)
  test_assignment(a_r, c(4, 1, 3, 2), 11:14)
  # values shorter than index
  test_assignment(a_r, 1:4, 11:12)
  test_assignment(a_r, 1:4, 11:13)
  test_assignment(a_r, 1:4, 33)
  # NA's
  test_assignment(a_r, 1:4, c(NA, NA, NA))
  expect_error(lset(a, c(NA, 3), 1:2))
  # empty index
  test_assignment(a_r, numeric(0), numeric(0))
  # empty values
  expect_error(lset(a, 1:4, numeric(0)))
  # out of range
  expect_error(lset(a, 20:30, 11))
  expect_error(lset(a, 3:9, 11))
  expect_error(lset(a, -10:1, 11))
  expect_error(lset(a, 0:1, 11))
  # overflow
  expect_error(lset(a, 1E10, 11))
  expect_error(lset(a, 4, 11E10))
})

test_that("logical vectors are assigned using lset", {
  a_r <- as.logical(c(TRUE, FALSE, TRUE, NA, NA))
  a   <- as_lvec(a_r)

  test_assignment(a_r, 1:4, c(TRUE, FALSE, TRUE, NA))
  test_assignment(a_r, c(4, 1, 3, 2), c(FALSE, TRUE, NA, FALSE))
  # values shorter than index
  test_assignment(a_r, 1:4, c(FALSE, TRUE))
  test_assignment(a_r, 1:4, c(TRUE, TRUE, FALSE))
  test_assignment(a_r, 1:4, c(TRUE))
  # NA's
  test_assignment(a_r, 1:4, as.logical(c(NA, NA, NA)))
  expect_error(lset(a, c(NA, 3), c(TRUE, FALSE)))
  # empty index
  test_assignment(a_r, numeric(0), logical(0))
  # empty values
  expect_error(lset(a, 1:4, logical(0)))
  # out of range
  expect_error(lset(a, 20:30, TRUE))
  expect_error(lset(a, 3:9, TRUE))
  expect_error(lset(a, -10:1, TRUE))
  expect_error(lset(a, 0:1, TRUE))
  # overflow
  expect_error(lset(a, 1E10, 11))
})

test_that("character vectors are assigned using lset", {
  a_r <- c("jan", "pier", NA, "corneel")
  a   <- as_lvec(a_r)

  test_assignment(a_r, 1:4, as.character(11:14))
  test_assignment(a_r, c(4, 1, 3, 2), as.character(11:14))
  # values shorter than index
  test_assignment(a_r, 1:4, as.character(11:12))
  test_assignment(a_r, 1:4, as.character(11:13))
  test_assignment(a_r, 1:4, as.character(33))
  # NA's
  test_assignment(a_r, 1:4, as.character(c(NA, NA, NA)))
  expect_error(lset(a, c(NA, 3), as.character(1:2)))
  # empty index
  test_assignment(a_r, numeric(0), character(0))
  # empty values
  expect_error(lset(a, 1:4, character(0)))
  # out of range
  expect_error(lset(a, 20:30, as.character(11)))
  expect_error(lset(a, 3:9, as.character(11)))
  expect_error(lset(a, -10:1, as.character(11)))
  expect_error(lset(a, 0:1, as.character(11)))
  # overflow
  expect_error(lset(a, 1E10, as.character(11)))
})

