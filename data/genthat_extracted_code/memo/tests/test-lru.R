context("LRU cache")

`%is%` <- expect_equal

test_that("cache stores values", {
  store <- lru_cache()
  store("foo", 1)
  store("bar", 2)
  store("baz", 3)
  expect_equal(1, store("foo", stop("should not be evaluated")))
  expect_equal(2, store("bar", stop("should not be evaluated")))
  expect_equal(3, store("baz", stop("should not be evaluated")))
  expect_equal(2, store("bar", 4))
})

test_that("cache incrementally expires old values", {
  store <- lru_cache(3)
  store("foo", 1)
  store("bar", 2)
  store("baz", 3)
  store("qux", 4)
  expect_equal(4, store("qux", stop("should not be evaluated")))
  expect_equal(3, store("baz", stop("should not be evaluated")))
  expect_equal(2, store("bar", stop("should not be evaluated")))
  expect_equal(100, store("foo", 100))
})

test_that("cache expires least recently accessed values", {
  store <- lru_cache(3)
  store("foo", 1)
  store("bar", 2)
  store("baz", 3)

  #from end of list
  expect_equal(1, store("foo", stop("should not be evaluated")))
  expect_equal(4, store("qux", 4))
  expect_equal(100, store("bar", 100))

  #from middle of list
  expect_equal(4, store("qux", stop("should not be evaluated")))
  expect_equal(200, store("baz", 200))
})

test_that("cache_stats extracts stats", {
  fib <- function(x) if (x <= 1) 1 else fib(x-1) + fib(x-2)
  fib <- memo(fib, key=pointer_key)
  fib(30)
  cache_stats(fib) %is%
      list(size = 5000, used = 31, hits = 28, misses = 31, expired = 0)
})
