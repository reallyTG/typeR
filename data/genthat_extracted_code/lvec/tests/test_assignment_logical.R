context("Assignment using logical index")

test_assignment <- function(a_r, index, values) {
  a <- as_lvec(a_r)
  lset(a, index, values)
  suppressWarnings({ a_r[index] <- values })
  expect_that(as_rvec(a), equals(a_r))
}

test_that("numeric vectors are assigned using lset", {
  a_r <- c(-1.2, 5E10, NA, NaN, 4.1)
  a   <- as_lvec(a_r)

  test_assignment(a_r, c(TRUE, FALSE, TRUE, TRUE, FALSE), 11:13)
  test_assignment(a_r, c(TRUE), 11:15)
  # values shorter than index
  test_assignment(a_r, c(TRUE, FALSE, TRUE, TRUE, FALSE), 11:12)
  test_assignment(a_r, c(TRUE), 15)
  # NA's
  test_assignment(a_r, c(TRUE, FALSE, TRUE, TRUE, FALSE), c(NA, NA, NA))
  expect_error(lset(a, c(TRUE, NA), 1:2))
  # empty index
  test_assignment(a_r, logical(0), numeric(0))
  # empty values
  expect_error(lset(a, c(TRUE, FALSE, TRUE, TRUE, FALSE), numeric(0)))
})

test_that("integer vectors are assigned using lset", {
  a_r <- as.integer(c(-1, 2, 1E9, NA, 1234))
  a   <- as_lvec(a_r)

  test_assignment(a_r, c(TRUE, FALSE, TRUE, TRUE, FALSE), 11:13)
  test_assignment(a_r, c(TRUE), 11:15)
  # values shorter than index
  test_assignment(a_r, c(TRUE, FALSE, TRUE, TRUE, FALSE), 11:12)
  test_assignment(a_r, c(TRUE), 15)
  # NA's
  test_assignment(a_r, c(TRUE, FALSE, TRUE, TRUE, FALSE), c(NA, NA, NA))
  expect_error(lset(a, c(TRUE, NA), 1:2))
  # empty index
  test_assignment(a_r, logical(0), integer(0))
  # empty values
  expect_error(lset(a, c(TRUE, FALSE, TRUE, TRUE, FALSE), numeric(0)))
  # overflow
  expect_error(lset(a, TRUE, 11E10))
})

test_that("logical vectors are assigned using lset", {
  a_r <- as.logical(c(TRUE, FALSE, TRUE, NA, NA))
  a   <- as_lvec(a_r)

  test_assignment(a_r, c(TRUE, FALSE, TRUE, TRUE, FALSE), c(TRUE, TRUE, FALSE))
  test_assignment(a_r, c(TRUE), c(TRUE, FALSE, FALSE, TRUE, TRUE))
  # values shorter than index
  test_assignment(a_r, c(TRUE, FALSE, TRUE, TRUE, FALSE), c(FALSE, TRUE))
  test_assignment(a_r, c(TRUE), TRUE)
  # NA's
  test_assignment(a_r, c(TRUE, FALSE, TRUE, TRUE, FALSE), as.logical(c(NA, NA, NA)))
  expect_error(lset(a, c(TRUE, NA), c(TRUE, FALSE)))
  # empty index
  test_assignment(a_r, logical(0), logical(0))
  # empty values
  expect_error(lset(a, c(TRUE, FALSE, TRUE, TRUE, FALSE), logical(0)))
})

test_that("character vectors are assigned using lset", {
  a_r <- c("jan", "pier", NA, "corneel", "janssen")
  a   <- as_lvec(a_r)

  test_assignment(a_r, c(TRUE, FALSE, TRUE, TRUE, FALSE), as.character(11:13))
  test_assignment(a_r, c(TRUE), as.character(11:15))
  # values shorter than index
  test_assignment(a_r, c(TRUE, FALSE, TRUE, TRUE, FALSE), as.character(11:12))
  test_assignment(a_r, c(TRUE), as.character(15))
  # NA's
  test_assignment(a_r, c(TRUE, FALSE, TRUE, TRUE, FALSE), as.character(c(NA, NA, NA)))
  expect_error(lset(a, c(TRUE, NA), as.character(1:2)))
  # empty index
  test_assignment(a_r, logical(0), character(0))
  # empty values
  expect_error(lset(a, c(TRUE, FALSE, TRUE, TRUE, FALSE), character(0)))
})

