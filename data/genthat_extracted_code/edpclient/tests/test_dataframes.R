test_that("identifying column manipulations work", {
  d <- data.frame(a = c(1, 2), b = c(3, 4), c = c(5, 6))

  # No identifying columns yet.
  expect_false(identifying(d$a))
  expect_length(identifying_columns(d), 0)

  # Mark "a" identifying and check that that is reflected.
  identifying(d$a) <- TRUE
  expect_true(identifying(d$a))
  expect_equal(identifying_columns(d), "a")

  # Mark the set c("b") identifying and check that that is reflected.
  identifying_columns(d) <- c("b")
  expect_false(identifying(d$a))
  expect_true(identifying(d$b))
  expect_equal(identifying_columns(d), "b")
})

test_that("display name manipulations work", {
  d <- data.frame(a = c(1, 2), b = c(3, 4), c = c(5, 6))

  # No display names.
  expect_true(is.na(display_name(d$a)))
  expect_equal(display_names(d),
               c(a = NA_character_, b = NA_character_, c = NA_character_))

  # Set a display name on "a".
  display_name(d$a) <- "AA"
  expect_equal(display_name(d$a), "AA")
  expect_equal(display_names(d), c(a = "AA", b = NA, c = NA))

  # Set display names as a vector.
  display_names(d) <- c("A2", NA, "C2")
  expect_equal(display_name(d$a), "A2")
  expect_equal(display_names(d), c(a = "A2", b = NA, c = "C2"))
})

test_that("stat type manipulations work", {
  d <- data.frame(a = c(1, 2))
  stat_type(d$a) <- "realAdditive"
  expect_equal(stat_type(d$a), "realAdditive")
})

test_that("precision manipulations work", {
  d <- data.frame(a = c(1, 2))
  expect_null(precision(d$a))
  precision(d$a) <- c(1, 4)
  expect_error(precision(d$a) <- c(2, 8))
  expect_error(precision(d$a) <- c("1", "2"))
  expect_error(precision(d$a) <- c(1, 2, 1))
  expect_equal(precision(d$a), c(1, 4))
  precision(d$a) <- NULL
  expect_null(precision(d$a))
})
