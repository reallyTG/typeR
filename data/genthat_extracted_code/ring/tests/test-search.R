context("search")

test_that("empty", {
  b <- ring_buffer_bytes_typed(10, double(1))
  for (type in SEARCH_TYPES) {
    expect_equal(test_search(b$.ptr, 0, type), -1L)
  }
})

test_that("trivial", {
  b <- ring_buffer_bytes_typed(10, double(1))
  b$push(0.5)

  for (type in SEARCH_TYPES) {
    expect_equal(test_search(b$.ptr, 0.0, type), -1L)
    expect_equal(test_search(b$.ptr, 0.5, type), 0L) # check exact
    expect_equal(test_search(b$.ptr, 1.0, type), 0L)
  }
})

## I suspect that once this is working, then everything will work
## pretty happily.
test_that("two", {
  b <- ring_buffer_bytes_typed(10, double(1))
  b$push(c(.3, .6))

  for (type in SEARCH_TYPES) {
    expect_equal(test_search(b$.ptr, 0.0, type), -1L)
    expect_equal(test_search(b$.ptr, 0.2, type), -1L)
    expect_equal(test_search(b$.ptr, 0.3, type),  0L)
    expect_equal(test_search(b$.ptr, 0.4, type),  0L)
    expect_equal(test_search(b$.ptr, 0.6, type),  1L)
    expect_equal(test_search(b$.ptr, 0.7, type),  1L)
  }
})

## A little more of the same, just to check for any further corner cases.
test_that("three", {
  b <- ring_buffer_bytes_typed(10, double(1))
  b$push(c(.3, .6, .9))

  for (type in SEARCH_TYPES) {
    expect_equal(test_search(b$.ptr, 0.0, type), -1L)
    expect_equal(test_search(b$.ptr, 0.2, type), -1L)
    expect_equal(test_search(b$.ptr, 0.3, type),  0L)
    expect_equal(test_search(b$.ptr, 0.4, type),  0L)
    expect_equal(test_search(b$.ptr, 0.6, type),  1L)
    expect_equal(test_search(b$.ptr, 0.7, type),  1L)
    ## These two are still incorrect, and I don't see why, as this
    ## works ok with more than 3 elements?  It's probably a bigger
    ## issue though.
    expect_equal(test_search(b$.ptr, 0.9, type),  2L)
    expect_equal(test_search(b$.ptr, 1.0, type),  2L)
  }
})

## The bisection case has a corner case with 3 elements so driving one
## more past it.
test_that("four", {
  b <- ring_buffer_bytes_typed(10, double(1))
  b$push(c(.2, .4, .6, .8))

  for (type in SEARCH_TYPES) {
    expect_equal(test_search(b$.ptr, 0.0, type), -1L)
    expect_equal(test_search(b$.ptr, 0.1, type), -1L)
    expect_equal(test_search(b$.ptr, 0.2, type),  0L)
    expect_equal(test_search(b$.ptr, 0.3, type),  0L)
    expect_equal(test_search(b$.ptr, 0.4, type),  1L)
    expect_equal(test_search(b$.ptr, 0.5, type),  1L)
    expect_equal(test_search(b$.ptr, 0.6, type),  2L)
    expect_equal(test_search(b$.ptr, 0.7, type),  2L)
    expect_equal(test_search(b$.ptr, 0.8, type),  3L)
    expect_equal(test_search(b$.ptr, 0.9, type),  3L)
  }
})

test_that("nontrivial, unwrapped", {
  ## (wrapped here refers to the state of the buffer)
  b <- ring_buffer_bytes_typed(10, double(1))
  set.seed(1)
  x <- sort(runif(8))
  b$push(x)

  y <- runif(10)
  z <- c(0, x) + diff(c(0, x, 1)) / 2

  for (type in SEARCH_TYPES) {
    for (idx in if (type == "bisect") seq_len(b$used()) - 1L else NA) {
      ## Confirm the ends can be found
      expect_equal(test_search(b$.ptr, 0.0, type, idx), -1L)
      expect_equal(test_search(b$.ptr, 1.0, type, idx), length(x) - 1L)

      i <- viapply(y, test_search, i = idx, buffer = b$.ptr, type = type)
      expect_equal(i, findInterval(y, x) - 1L)

      i <- viapply(z, test_search, i = idx, buffer = b$.ptr, type = type)
      expect_equal(i, findInterval(z, x) - 1L)

      i <- viapply(x, test_search, i = idx, buffer = b$.ptr, type = type)
      expect_equal(i, findInterval(x, x) - 1L)
    }
  }
})

test_that("nontrivial, wrapped", {
  set.seed(10)
  b <- ring_buffer_bytes_typed(10, double(1))
  b$push(rep(1, 6))
  b$take(6)
  x <- sort(runif(8))
  b$push(x)

  y <- runif(10)
  z <- c(0, x) + diff(c(0, x, 1)) / 2

  for (type in SEARCH_TYPES) {
    for (idx in if (type == "bisect") seq_len(b$used()) - 1L else NA) {
      expect_equal(test_search(b$.ptr, 0.0, type, idx), -1L)
      expect_equal(test_search(b$.ptr, 1.0, type, idx), length(x) - 1L)

      i <- viapply(y, test_search, i = idx, buffer = b$.ptr, type = type)
      expect_equal(i, findInterval(y, x) - 1L)

      ## Test all the intervals:
      i <- viapply(z, test_search, i = idx, buffer = b$.ptr, type = type)
      expect_equal(i, findInterval(z, x) - 1L)

      ## Test all the values:
      i <- viapply(x, test_search, i = idx, buffer = b$.ptr, type = type)
      expect_equal(i, findInterval(x, x) - 1L)
    }
  }
})
