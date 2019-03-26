
context("match")

test_that("match works for numeric vectors", {
  x <- sample(c(2:5, NA, 7:10))
  y <- sample(c(1, 3, 6, 9, 12, NA))
  m_r <- match(x, y)
  m   <- match(as_lvec(x), y)
  expect_that(as_rvec(m), equals(m_r))

  m_r <- match(x, y, incomparables = NA)
  m   <- match(as_lvec(x), y, na_incomparable = TRUE)
  expect_that(as_rvec(m), equals(m_r))

  y <- sample(c(1, 3))
  m_r <- match(x, y)
  m   <- match(as_lvec(x), y)
  expect_that(as_rvec(m), equals(m_r))

  m_r <- match(x, y, incomparables = NA)
  m   <- match(as_lvec(x), y, na_incomparable = TRUE)
  expect_that(as_rvec(m), equals(m_r))

  # No matches
  y <- sample(c(1))
  m_r <- match(x, y)
  m   <- match(as_lvec(x), y)
  expect_that(as_rvec(m), equals(m_r))

  m_r <- match(x, y, incomparables = NA)
  m   <- match(as_lvec(x), y, na_incomparable = TRUE)
  expect_that(as_rvec(m), equals(m_r))

  # Empty vectors
  x <- numeric(0)
  y <- numeric(0)
  m_r <- match(x, y)
  m   <- match(as_lvec(x), y)
  expect_that(as_rvec(m), equals(m_r))

  m_r <- match(x, y, incomparables = NA)
  m   <- match(as_lvec(x), y, na_incomparable = TRUE)
  expect_that(as_rvec(m), equals(m_r))
})

test_that("match works for integer vectors", {
  x <- as.integer(sample(c(2:5, NA, 7:10)))
  y <- as.integer(sample(c(1, 3, 6, 9, 12, NA)))
  m_r <- match(x, y)
  m   <- match(as_lvec(x), y)
  expect_that(as_rvec(m), equals(m_r))

  m_r <- match(x, y, incomparables = NA)
  m   <- match(as_lvec(x), y, na_incomparable = TRUE)
  expect_that(as_rvec(m), equals(m_r))

  y <- as.integer(sample(c(1, 3)))
  m_r <- match(x, y)
  m   <- match(as_lvec(x), y)
  expect_that(as_rvec(m), equals(m_r))

  m_r <- match(x, y, incomparables = NA)
  m   <- match(as_lvec(x), y, na_incomparable = TRUE)
  expect_that(as_rvec(m), equals(m_r))

  # No matches
  y <- as.integer(sample(c(1)))
  m_r <- match(x, y)
  m   <- match(as_lvec(x), y)
  expect_that(as_rvec(m), equals(m_r))

  m_r <- match(x, y, incomparables = NA)
  m   <- match(as_lvec(x), y, na_incomparable = TRUE)
  expect_that(as_rvec(m), equals(m_r))

  # Empty vectors
  x <- integer(0)
  y <- integer(0)
  m_r <- match(x, y)
  m   <- match(as_lvec(x), y)
  expect_that(as_rvec(m), equals(m_r))

  m_r <- match(x, y, incomparables = NA)
  m   <- match(as_lvec(x), y, na_incomparable = TRUE)
  expect_that(as_rvec(m), equals(m_r))
})

test_that("match works for logical vectors", {
  x <- sample(c(TRUE, NA, FALSE))
  y <- sample(c(TRUE, NA))
  m_r <- match(x, y)
  m   <- match(as_lvec(x), y)
  expect_that(as_rvec(m), equals(m_r))

  m_r <- match(x, y, incomparables = NA)
  m   <- match(as_lvec(x), y, na_incomparable = TRUE)
  expect_that(as_rvec(m), equals(m_r))

  y <- sample(c(FALSE))
  m_r <- match(x, y)
  m   <- match(as_lvec(x), y)
  expect_that(as_rvec(m), equals(m_r))

  m_r <- match(x, y, incomparables = NA)
  m   <- match(as_lvec(x), y, na_incomparable = TRUE)
  expect_that(as_rvec(m), equals(m_r))

  # No matches
  x <- sample(c(TRUE, NA))
  y <- sample(c(FALSE))
  m_r <- match(x, y)
  m   <- match(as_lvec(x), y)
  expect_that(as_rvec(m), equals(m_r))

  m_r <- match(x, y, incomparables = NA)
  m   <- match(as_lvec(x), y, na_incomparable = TRUE)
  expect_that(as_rvec(m), equals(m_r))

  # Empty vectors
  x <- logical(0)
  y <- logical(0)
  m_r <- match(x, y)
  m   <- match(as_lvec(x), y)
  expect_that(as_rvec(m), equals(m_r))

  m_r <- match(x, y, incomparables = NA)
  m   <- match(as_lvec(x), y, na_incomparable = TRUE)
  expect_that(as_rvec(m), equals(m_r))
})

test_that("match works for character vectors", {
  x <- letters[as.integer(sample(c(2:5, NA, 7:10)))]
  y <- letters[as.integer(sample(c(1, 3, 6, 9, 12, NA)))]
  m_r <- match(x, y)
  m   <- match(as_lvec(x), y)
  expect_that(as_rvec(m), equals(m_r))

  m_r <- match(x, y, incomparables = NA)
  m   <- match(as_lvec(x), y, na_incomparable = TRUE)
  expect_that(as_rvec(m), equals(m_r))

  y <- letters[as.integer(sample(c(1, 3)))]
  m_r <- match(x, y)
  m   <- match(as_lvec(x), y)
  expect_that(as_rvec(m), equals(m_r))

  m_r <- match(x, y, incomparables = NA)
  m   <- match(as_lvec(x), y, na_incomparable = TRUE)
  expect_that(as_rvec(m), equals(m_r))

  # No matches
  y <- letters[as.integer(sample(c(1)))]
  m_r <- match(x, y)
  m   <- match(as_lvec(x), y)
  expect_that(as_rvec(m), equals(m_r))

  m_r <- match(x, y, incomparables = NA)
  m   <- match(as_lvec(x), y, na_incomparable = TRUE)
  expect_that(as_rvec(m), equals(m_r))

  # Empty vectors
  x <- character(0)
  y <- character(0)
  m_r <- match(x, y)
  m   <- match(as_lvec(x), y)
  expect_that(as_rvec(m), equals(m_r))

  m_r <- match(x, y, incomparables = NA)
  m   <- match(as_lvec(x), y, na_incomparable = TRUE)
  expect_that(as_rvec(m), equals(m_r))
})
