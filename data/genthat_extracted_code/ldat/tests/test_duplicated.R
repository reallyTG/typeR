context("Duplicated")

test_duplicated <- function(x, ...) {
  x_r <- as_rvec(x)

  d <- duplicated(x, ...)
  d_r <- duplicated(x_r)
  expect_that(as_rvec(sort(x[d])), equals(sort(x_r[d_r], na.last = TRUE)))

  d <- duplicated(x, incomparables = NA, ...)
  d_r <- duplicated(x_r, incomparables = NA)
  expect_that(as_rvec(sort(x[d])), equals(sort(x_r[d_r], na.last = TRUE)))
}

test_that("duplicated works", {
  x <- as_lvec(c(1,10,20,1,NA,100,NA,10))
  test_duplicated(x)
  test_duplicated(x, chunk_size = 2)

  x <- as_lvec(c(TRUE, FALSE, TRUE, NA, NA))
  test_duplicated(x)
  test_duplicated(x, chunk_size = 2)

  x <- as_lvec(letters[c(1,10,20,1,NA,22,NA,10)])
  test_duplicated(x)
  test_duplicated(x, chunk_size = 2)
})

test_unique <- function(x, ...) {
  x_r <- as_rvec(x)

  d <- unique(x, ...)
  d_r <- unique(x_r)
  expect_that(as_rvec(sort(d)), equals(sort(d_r, na.last = TRUE)))

  d <- unique(x, incomparables = NA, ...)
  d_r <- unique(x_r, incomparables = NA)
  expect_that(as_rvec(sort(d)), equals(sort(d_r, na.last = TRUE)))
}

test_that("unique works", {
  x <- as_lvec(c(1,10,20,1,NA,100,NA,10))
  test_unique(x)
  test_unique(x, chunk_size = 2)

  x <- as_lvec(c(TRUE, FALSE, TRUE, NA, NA))
  test_unique(x)
  test_unique(x, chunk_size = 2)

  x <- as_lvec(letters[c(1,10,20,1,NA,22,NA,10)])
  test_unique(x)
  test_unique(x, chunk_size = 2)
})

