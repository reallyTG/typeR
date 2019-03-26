
context("NA Buckets")


test_that("NA bucket not in levels when not needed", {
  x <- seq.int(0, 1, 0.25)
  y <- fancycut(x, low = '[0,0.5]', high = '(0.5, 1]')

  expect_identical(levels(y), c("low", "high"))
})


test_that("NA bucket used when needed", {
  x <- c(NA, seq.int(0, 1, 0.25))
  y <- fancycut(x, low = '[0,0.5]', high = '(0.5, 1]')

  expect_identical(levels(y), c("low", "high", NA))
})


test_that("Still works when specials are not NA", {
  na.bucket <- 'N/A'
  unmatched.bucket <- 'UNK'
  x <- c(NA, seq.int(0, 1, 0.25), 2, 3)
  y <- fancycut(
    x,
    low = '[0,0.5]',
    high = '(0.5, 1]',
    na.bucket = na.bucket,
    unmatched.bucket = unmatched.bucket
  )

  expect_identical(levels(y), c("low", "high", 'N/A', 'UNK'))
})


test_that("Includes unmatches but no NAs", {
  na.bucket <- 'N/A'
  unmatched.bucket <- 'UNK'
  x <- c(seq.int(0, 1, 0.25), 2, 3)
  y <- fancycut(
    x,
    low = '[0,0.5]',
    high = '(0.5, 1]',
    na.bucket = na.bucket,
    unmatched.bucket = unmatched.bucket
  )

  expect_identical(levels(y), c("low", "high", 'UNK'))
})


