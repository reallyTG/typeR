
context("Assignment using range index")

test_assignment <- function(a_r, range, values, no_values = FALSE) {
  i <- seq.int(range[1], range[2], by = 1)
  a <- as_lvec(a_r)
  if (no_values) {
    lset(a, range = range, values)
  } else {
    lset(a, range = range, values = values)
  }
  suppressWarnings({ a_r[i] <- values })
  expect_that(as_rvec(a), equals(a_r))
}


test_that("numeric vectors are assigned using lset", {
  a_r <- c(-1.2, 5E10, NA, NaN, 4.1)
  a   <- as_lvec(a_r)

  test_assignment(a_r, c(1,3), 101:103)
  test_assignment(a_r, c(1,3), 22)
  test_assignment(a_r, c(2,4), 22:23)
  # NA
  test_assignment(a_r, c(2,4), NA)
  expect_error(test_assignment(a_r, c(NA,4), NA))
  expect_error(test_assignment(a_r, c(2,NA), NA))
  expect_error(test_assignment(a_r, c(NA,NA), NA))
  # Inf
  test_assignment(a_r, c(2,4), values = c(Inf, -Inf))
  # Empty 
  expect_error(lset(as_lvec(a_r), range = c(2,2), values = numeric(0)))
  expect_error(lset(as_lvec(a_r), range = numeric(0), values = numeric(0)))
  # Out of range
  expect_error(lset(as_lvec(a_r), range = c(1, 100), values = 42))
  expect_error(lset(as_lvec(a_r), range = c(0, 4), values = 42))
  expect_error(lset(as_lvec(a_r), range = c(4, 0), values = 42))
  # Test that second argument is used as values when range is given
  test_assignment(a_r, c(1,3), 101:103, no_values = TRUE)
})

test_that("integer vectors are assigned using lset", {
  a_r <- c(1, 5, -10, NA, 1, 0)
  a   <- as_lvec(a_r)

  test_assignment(a_r, c(1,3), 101:103)
  test_assignment(a_r, c(1,3), 22)
  test_assignment(a_r, c(2,4), 22:23)
  # NA
  test_assignment(a_r, c(2,4), NA)
  expect_error(test_assignment(a_r, c(NA,4), NA))
  expect_error(test_assignment(a_r, c(2,NA), NA))
  expect_error(test_assignment(a_r, c(NA,NA), NA))
  # Empty 
  expect_error(lset(as_lvec(a_r), range = c(2,2), values = integer(0)))
  expect_error(lset(as_lvec(a_r), range = numeric(0), values = integer(0)))
  # Out of range
  expect_error(lset(as_lvec(a_r), range = c(1, 100), values = 42))
  expect_error(lset(as_lvec(a_r), range = c(0, 4), values = 42))
  expect_error(lset(as_lvec(a_r), range = c(4, 0), values = 42))
  # Test that second argument is used as values when range is given
  test_assignment(a_r, c(1,3), 101:103, no_values = TRUE)
})

test_that("logical vectors are assigned using lset", {
  a_r <- c(TRUE, FALSE, TRUE, NA, NA)
  a   <- as_lvec(a_r)

  test_assignment(a_r, c(1,3), c(TRUE, FALSE, TRUE))
  test_assignment(a_r, c(1,3), c(TRUE))
  test_assignment(a_r, c(2,4), c(FALSE, TRUE))
  # NA
  test_assignment(a_r, c(2,4), NA)
  expect_error(test_assignment(a_r, c(NA,4), NA))
  expect_error(test_assignment(a_r, c(2,NA), NA))
  expect_error(test_assignment(a_r, c(NA,NA), NA))
  # Empty 
  expect_error(lset(as_lvec(a_r), range = c(2,2), values = logical(0)))
  expect_error(lset(as_lvec(a_r), range = numeric(0), values = logical(0)))
  # Out of range
  expect_error(lset(as_lvec(a_r), range = c(1, 100), values = TRUE))
  expect_error(lset(as_lvec(a_r), range = c(0, 4), values = TRUE))
  expect_error(lset(as_lvec(a_r), range = c(4, 0), values = TRUE))
  # Test that second argument is used as values when range is given
  test_assignment(a_r, c(1,3), c(TRUE, FALSE, FALSE), no_values = TRUE)
})

test_that("character vectors are assigned using lset", {
  a_r <- c("jan", "pier", NA, "tjorres", "korneel")
  a   <- as_lvec(a_r)

  test_assignment(a_r, c(1,3), c("foo", "bar", "foobar"))
  test_assignment(a_r, c(1,3), c("foobar"))
  test_assignment(a_r, c(2,4), c("foo", "bar"))
  # NA
  test_assignment(a_r, c(2,4), as.character(NA))
  expect_error(test_assignment(a_r, c(NA,4), as.character(NA)))
  expect_error(test_assignment(a_r, c(2,NA), as.character(NA)))
  expect_error(test_assignment(a_r, c(NA,NA), as.character(NA)))
  # Empty 
  expect_error(lset(as_lvec(a_r), range = c(2,2), values = character(0)))
  expect_error(lset(as_lvec(a_r), range = numeric(0), values = character(0)))
  # Out of range
  expect_error(lset(as_lvec(a_r), range = c(1, 100), values = "foo"))
  expect_error(lset(as_lvec(a_r), range = c(0, 4), values = "foo"))
  expect_error(lset(as_lvec(a_r), range = c(4, 0), values = "foo"))
  # Test that second argument is used as values when range is given
  test_assignment(a_r, c(1,3), c("foo", "bar", NA), no_values = TRUE)
})

