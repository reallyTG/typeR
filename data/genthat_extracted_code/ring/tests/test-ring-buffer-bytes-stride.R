context("stride")

test_that("empty", {
  buf <- ring_buffer_bytes(100, 5)

  expect_equal(buf$stride(), 5)

  expect_equal(buf$size(TRUE), 500L)
  expect_equal(buf$size(FALSE), 100L)
  expect_equal(buf$size(), 100L)

  expect_equal(buf$used(TRUE), 0L)
  expect_equal(buf$used(FALSE), 0L)
  expect_equal(buf$used(), 0L)

  expect_equal(buf$free(TRUE), 500L)
  expect_equal(buf$free(FALSE), 100L)
  expect_equal(buf$free(), 100L)

  expect_equal(buf$data(), raw(505))
  expect_equal(buf$bytes_data(), 505L)

  expect_equal(buf$head_pos(TRUE), 0L)
  expect_equal(buf$head_pos(FALSE), 0L)
  expect_equal(buf$head_pos(), 0L)

  expect_equal(buf$tail_pos(TRUE), 0L)
  expect_equal(buf$tail_pos(FALSE), 0L)
  expect_equal(buf$tail_pos(), 0L)

  expect_true(buf$is_empty())
  expect_false(buf$is_full())
})

test_that("set", {
  size <- 100L
  stride <- 5L
  buf <- ring_buffer_bytes(100, 5)

  ## First, set a few entries to something nonzero:
  n <- 3L
  expect_equal(buf$set(as.raw(1), n), n)

  ## Lots of checking of the state of the buffer:
  expect_false(buf$is_empty())
  expect_false(buf$is_full())

  expect_equal(buf$size(TRUE), size * stride)
  expect_equal(buf$size(FALSE), size)
  expect_equal(buf$size(), size)

  expect_equal(buf$used(TRUE), n * stride)
  expect_equal(buf$used(FALSE), n)
  expect_equal(buf$used(), n)

  expect_equal(buf$free(TRUE), size * stride - n * stride)
  expect_equal(buf$free(FALSE), size - n)
  expect_equal(buf$free(), size - n)

  expect_equal(buf$data(),
               pad(as.raw(rep(1, n * stride)), (size + 1) * stride))
  expect_equal(buf$bytes_data(), (size + 1) * stride)

  expect_equal(buf$head_pos(TRUE), n * stride)
  expect_equal(buf$head_pos(FALSE), n)
  expect_equal(buf$head_pos(), n)

  expect_equal(buf$tail_pos(TRUE), 0L)
  expect_equal(buf$tail_pos(FALSE), 0L)
  expect_equal(buf$tail_pos(), 0L)

  ## Read a bit of the buffer and make sure that we're OK here.
  expect_equal(buf$read(0), raw())
  expect_equal(buf$read(1), as.raw(rep(1, stride)))
  expect_equal(buf$read(n), as.raw(rep(1, n * stride)))
  expect_error(buf$read(n + 1),
               "Buffer underflow")

  ## And check the tail offset works as expected
  expect_equal(buf$tail_offset(0), as.raw(rep(1, stride)))
  expect_equal(buf$tail_offset(n - 1), as.raw(rep(1, stride)))
  expect_error(buf$tail_offset(n),
               "Buffer underflow")

  ## Then, destructive modification: read a set of bytes:
  expect_equal(buf$take(0), raw())
  expect_equal(buf$take(1), as.raw(rep(1, stride)))

  expect_false(buf$is_empty())
  expect_false(buf$is_full())

  expect_equal(buf$head_pos(TRUE), n * stride)
  expect_equal(buf$head_pos(FALSE), n)
  expect_equal(buf$head_pos(), n)

  expect_equal(buf$tail_pos(TRUE), stride)
  expect_equal(buf$tail_pos(FALSE), 1L)
  expect_equal(buf$tail_pos(), 1L)

  expect_equal(buf$used(TRUE), (n - 1) * stride)
  expect_equal(buf$used(FALSE), n - 1)

  expect_equal(buf$free(TRUE), (size - n + 1) * stride)
  expect_equal(buf$free(FALSE), size - n + 1)

  expect_equal(buf$tail_offset(0), as.raw(rep(1, stride)))
  expect_equal(buf$tail_offset(n - 2), as.raw(rep(1, stride)))
  expect_error(buf$tail_offset(n - 1),
               "Buffer underflow")

  ## Read the rest:
  expect_equal(buf$take(n - 1),
               as.raw(rep(1, (n - 1) * stride)))

  expect_true(buf$is_empty())
  expect_false(buf$is_full())

  expect_equal(buf$head_pos(TRUE), n * stride)
  expect_equal(buf$head_pos(FALSE), n)
  expect_equal(buf$tail_pos(TRUE), n * stride)
  expect_equal(buf$tail_pos(FALSE), n)
  expect_equal(buf$used(TRUE), 0)
  expect_equal(buf$used(FALSE), 0)
  expect_equal(buf$free(TRUE), size * stride)
  expect_equal(buf$free(FALSE), size)
})

test_that("incorrect push", {
  buf <- ring_buffer_bytes(100, 5)
  expect_error(buf$push(as.raw(rep(1, 3))), "Incorrect size data")
  expect_true(all(buf$data() == as.raw(0L)))
})

test_that("set with vector", {
  s <- 5L
  buf <- ring_buffer_bytes(100, s)
  expect_true(all(buf$data() == as.raw(0)))
  pat <- random_bytes(s)
  expect_equal(buf$set(pat, 1), 1)

  expect_equal(buf$data(), pad(pat, buf$size(TRUE) + s))

  pat2 <- random_bytes(s)
  expect_equal(buf$set(pat2, 20), 20)

  expect_equal(buf$data(),
               pad(c(pat, rep(pat2, 20)), buf$size(TRUE) + s))

  pat3 <- random_bytes(s)
  expect_equal(buf$set(pat3, 85), 85)

  buf$data()

  expect_equal(buf$read(100), c(rep(pat2, 15), rep(pat3, 85)))

  expect_error(buf$set(random_bytes(0), 1), "Invalid length")
  expect_error(buf$set(random_bytes(2), 1), "Invalid length")
  expect_error(buf$set(random_bytes(10), 1), "Invalid length")

  buf$set(as.raw(1), 100)
  expect_equal(buf$read(100), rep(as.raw(1), s * 100))
})

test_that("overflow works (push)", {
  size <- 10
  stride <- 2

  buf <- ring::ring_buffer_bytes(size, stride)
  expect_equal(buf$free(), size)
  expect_equal(buf$free(TRUE), size * stride)

  d1 <- as.raw(rep(1, stride))
  d2 <- as.raw(rep(2:(size + 1), each = stride))

  x1 <- buf$push(d1)
  expect_equal(buf$free(), size - 1)
  expect_equal(buf$free(TRUE), (size - 1) * stride)
  expect_equal(x1, stride)

  ## Overflow, just:
  x2 <- buf$push(d2)
  expect_equal(x2, 0)

  expect_equal(buf$free(), 0)
  expect_equal(buf$free(TRUE), 0)

  ## All the data is still in here :)
  expect_equal(buf$data(), c(d1, d2))

  expect_equal(buf$head_pos(), 0) # ready to write to the beginning
  expect_equal(buf$tail_pos(), 1) # ready to read from position 1
  expect_equal(buf$head_pos(TRUE), 0)
  expect_equal(buf$tail_pos(TRUE), stride)
})

test_that("overflow works (set)", {
  size <- 10
  stride <- 2

  buf <- ring::ring_buffer_bytes(size, stride)
  expect_equal(buf$free(), size)
  expect_equal(buf$free(TRUE), size * stride)

  d1 <- as.raw(1)
  d2 <- as.raw(2)

  x1 <- buf$set(d1, 1)
  expect_equal(buf$free(), size - 1)
  expect_equal(buf$free(TRUE), (size - 1) * stride)
  expect_equal(x1, 1)

  ## Overflow, just:
  x2 <- buf$set(d2, size)
  expect_equal(x2, size)

  expect_equal(buf$free(), 0)
  expect_equal(buf$free(TRUE), 0)

  ## All the data is still in here :)
  expect_equal(buf$data(), rep(c(d1, d2), c(1, size) * stride))

  expect_equal(buf$head_pos(), 0) # ready to write to the beginning
  expect_equal(buf$tail_pos(), 1) # ready to read from position 1
  expect_equal(buf$head_pos(TRUE), 0)
  expect_equal(buf$tail_pos(TRUE), stride)
})
