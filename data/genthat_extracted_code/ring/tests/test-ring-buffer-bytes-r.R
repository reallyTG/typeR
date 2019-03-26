## These are tests that are not part of the upstream ringbuf library
## but are added for the R version.  I'll switch the organisation
## around later, perhaps.

context("ring_buffer_bytes (r)")

test_that("tail offset", {
  bytes <- as.raw(0:255)
  buf <- ring_buffer_bytes(length(bytes))
  expect_equal(buf$push(bytes), length(bytes))
  expect_true(buf$is_full())

  n <- 20

  cmp <- as.raw(seq_len(n) - 1L)
  expect_equal(buf$read(n), cmp)
  tmp <- vapply(seq_len(n) - 1L,
                function(x) buf$tail_offset(x), raw(1))
  expect_equal(tmp, cmp)
  expect_equal(buf$take(n), cmp)

  cmp <- as.raw(as.integer(cmp) + n)
  expect_equal(buf$read(n), cmp)

  tmp <- vapply(seq_len(n) - 1L, buf$tail_offset, raw(1))
  expect_equal(tmp, cmp)

  expect_error(buf$tail_offset(300), "Buffer underflow")

  expect_equal(buf$tail_offset(255 - n), as.raw(255))
  expect_error(buf$tail_offset(255 - n + 1),
               "Buffer underflow")

  ## Add a bunch more bytes in so that we wrap the tail:
  cmp <- as.raw(rev(seq_len(n) - 1L))
  buf$push(cmp)
  expect_true(buf$is_full())
})

## This one duplicates the simple checks used in the environment based
## ring buffer:
test_that("head offset (1)", {
  n <- 10
  buf <- ring_buffer_bytes(n)
  m <- 4
  data <- as.raw(1:m)
  buf$push(data)

  expect_equal(buf$head_offset(0), data[m])
  expect_equal(buf$head_offset(1), data[m - 1])
  expect_equal(buf$head_offset(m - 1), data[1])
  expect_error(buf$head_offset(m), "Buffer underflow")
})

## This one is more involved.
test_that("head offset", {
  bytes <- as.raw(0:255)
  buf <- ring_buffer_bytes(length(bytes))
  expect_equal(buf$push(bytes), length(bytes))
  expect_true(buf$is_full())

  n <- 20

  cmp <- rev(bytes)[seq_len(n)]
  ## expect_equal(buf$read_head(n), cmp)
  tmp <- vapply(seq_len(n) - 1L,
                function(x) buf$head_offset(x), raw(1))
  expect_equal(tmp, cmp)

  buf$take(n)

  expect_error(buf$head_offset(300), "Buffer underflow")
  expect_equal(buf$head_offset(255 - n), bytes[n + 1])
  expect_error(buf$head_offset(255 - n + 1),
               "Buffer underflow")

  ## Add a bunch more bytes in so that we wrap the tail:
  cmp <- as.raw(rev(seq_len(n) - 1L))
  buf$push(cmp)
  expect_true(buf$is_full())

  tmp1 <- vapply(seq_len(256) - 1L,
                 function(x) buf$head_offset(x), raw(1))
  tmp2 <- vapply(seq_len(256) - 1L,
                 function(x) buf$tail_offset(x), raw(1))
  expect_equal(tmp1, rev(tmp2))
})

test_that("impossible sizes", {
  expect_error(ring_buffer_bytes(0),
               "Can't create ring buffer with size 0")
  expect_error(ring_buffer_bytes(10, 0),
               "Can't create ring buffer with stride 0")
})

test_that("input validation", {
  expect_error(ring_buffer_bytes(pi)$size(),
               "Expected an integer value")
  expect_error(ring_buffer_bytes(-1),
               "Expected a nonnegative value")
  expect_error(ring_buffer_bytes(-1L),
               "Expected a nonnegative value")
  expect_error(ring_buffer_bytes(Inf),
               "Expected a nonnegative value")
  expect_error(ring_buffer_bytes(NA_real_),
               "Expected a nonnegative value")
  expect_error(ring_buffer_bytes(NA_integer_),
               "Expected a nonnegative value")
})

## unusual direction:
test_that("take_head", {
  bytes <- as.raw(0:255)
  n <- length(bytes)
  buf <- ring_buffer_bytes(n)
  expect_equal(buf$push(bytes), n)
  expect_true(buf$is_full())

  expect_equal(buf$read_head(0), raw(0))
  expect_equal(buf$read_head(1), tail(bytes, 1))
  expect_equal(buf$read_head(2), rev(tail(bytes, 2)))
  expect_equal(buf$read_head(n), rev(bytes))
  expect_error(buf$read_head(n + 1L), "Buffer underflow")

  m <- 15
  buf$take(m)
  b2 <- sample(bytes, m)
  buf$push(b2)
  expect_equal(buf$read_head(0), raw(0))
  expect_equal(buf$read_head(1), tail(b2, 1))
  expect_equal(buf$read_head(m), rev(b2))
  cmp <- c(rev(b2), rev(bytes[-seq_len(m)]))
  expect_equal(buf$read_head(n), cmp)

  expect_equal(buf$take_head(0), raw(0))
  expect_equal(buf$read_head(n), cmp)

  expect_equal(buf$take_head(1), cmp[1])
  expect_equal(buf$read_head(n - 1), cmp[-1])

  expect_equal(buf$take_head(m - 1), cmp[2:m])
  expect_equal(buf$read_head(n - m), cmp[-seq_len(m)])

  expect_error(buf$take_head(buf$used() + 1),
               "Buffer underflow")
})

test_that("head() behaviour", {
  b <- ring_buffer_bytes(10)
  expect_error(b$head(), "empty")
  expect_error(b$tail(), "empty")
  b$push(as.raw(1:4))
  expect_equal(b$tail(), as.raw(1))
  expect_equal(b$tail_offset(0), as.raw(1))
  ## In contrast with the C API this returns the *most recently added
  ## element*, not the memory that will be written to next.
  expect_equal(b$head(), as.raw(4))
  expect_equal(b$head_offset(0), as.raw(4))
})

test_that("duplicate", {
  n <- 10
  buf <- ring_buffer_bytes(10)
  buf$push(as.raw(1:12))
  buf$take(3)

  expect_equal(buf$head_pos(), 1) # NOTE: different to env!
  expect_equal(buf$tail_pos(), 5)
  expect_equal(buf$used(), 7)
  expect_equal(buf$size(), n)
  expect_equal(buf$read(buf$used()), as.raw(6:12))

  cpy <- buf$duplicate()

  ## Source unchanged:
  for (x in list(buf, cpy)) {
    expect_equal(x$head_pos(), 1)
    expect_equal(x$tail_pos(), 5)
    expect_equal(x$used(), 7)
    expect_equal(x$size(), n)
    expect_equal(x$read(x$used()), as.raw(6:12))
  }

  ## But we can move the two buffers independently.
  expect_equal(cpy$take(2), as.raw(6:7))
  cpy$push(as.raw(13))

  expect_equal(buf$head_pos(), 1)
  expect_equal(buf$tail_pos(), 5)
  expect_equal(buf$used(), 7)
  expect_equal(buf$size(), n)
  expect_equal(buf$read(buf$used()), as.raw(6:12))

  expect_equal(cpy$head_pos(), 2)
  expect_equal(cpy$tail_pos(), 7)
  expect_equal(cpy$used(), 6)
  expect_equal(cpy$size(), n)
  expect_equal(cpy$read(cpy$used()), as.raw(8:13))
})

test_that("head_advance", {
  n <- 5
  s <- 16
  b <- ring_buffer_bytes(n, s)

  ## Some bytes to stuff into the buffer; enough to wrap the buffer
  tmp <- lapply(seq_len(n + 2), function(...) random_bytes(s))

  for (i in seq_along(tmp)) {
    ok <- test_advance_head(b, tmp[[i]])
    expect_true(ok)
    expect_identical(b$read_head(1), tmp[[i]])
    j <- max(1, i - b$used() + 1):i
    expect_identical(b$read(b$used()), unlist(tmp[j]))
  }
})

## Overflow functions are added to:
##
## * set
## * set_stride
## * push
## * copy
## * head_advance

## Of the different overflow actions, error is the easiest:
test_that("overflow error; set", {
  n <- 10
  s <- 6
  b <- ring_buffer_bytes(n, s, "error")
  pat <- random_bytes(1)

  expect_error(b$set(pat, n + 1),
               "Buffer overflow (adding 11 elements, but 10 available)",
               fixed = TRUE)
  expect_true(b$is_empty())
  b$set(pat, n)
  expect_true(b$is_full())
  expect_error(b$set(pat, 1),
               "Buffer overflow (adding 1 elements, but 0 available)",
               fixed = TRUE)
  expect_equal(b$take(1), rep(pat, s))
})

test_that("overflow error; set_stride", {
  n <- 10
  s <- 6
  b <- ring_buffer_bytes(n, s, "error")
  pat <- random_bytes(s)

  expect_error(b$set(pat, n + 1),
               "Buffer overflow (adding 11 elements, but 10 available)",
               fixed = TRUE)
  expect_true(b$is_empty())
  b$set(pat, n)
  expect_true(b$is_full())
  expect_error(b$set(pat, 1),
               "Buffer overflow (adding 1 elements, but 0 available)",
               fixed = TRUE)
  expect_equal(b$take(1), pat)
})

test_that("overflow error; push", {
  n <- 10
  s <- 6
  b <- ring_buffer_bytes(n, s, "error")

  expect_error(b$push(random_bytes((n + 1) * s)),
               "Buffer overflow (adding 11 elements, but 10 available)",
               fixed = TRUE)
  expect_true(b$is_empty())
})

test_that("overflow error; copy", {
  n <- 10
  s <- 6
  b1 <- ring_buffer_bytes(n + 1, s)
  b2 <- ring_buffer_bytes(n, s, "error")

  b1$push(random_bytes((n + 1) * s))
  expect_error(b1$copy(b2, n + 1),
               "Buffer overflow (adding 11 elements, but 10 available)",
               fixed = TRUE)
  expect_true(b2$is_empty())
  expect_true(b1$is_full())
})

test_that("incompatible stride on copy", {
  n <- 10
  s <- 6
  b1 <- ring_buffer_bytes(n, s)
  b1$push(random_bytes((n + 1) * s))

  b2 <- ring_buffer_bytes(n, s + 1)
  expect_error(b1$copy(b2, 1),
               "Can't copy as buffers differ in their stride (6 vs 7)",
               fixed = TRUE)
})

test_that("can't self copy", {
  n <- 10
  s <- 6
  b1 <- ring_buffer_bytes(n, s)

  expect_error(b1$copy(b1, 1),
               "Can't copy a buffer into itself",
               fixed = TRUE)
})

test_that("grow - exact", {
  ## First, try manually growing a buffer under various states.  This
  ## has slightly fewer moving parts than doing this reactively based
  ## on overflow.
  ##
  ## There are three scenarios to try here: empty, partially full and
  ## totally full.
  n <- 10
  s <- 6
  e <- 3

  ## (1) empty
  buf <- ring_buffer_bytes(n, s)
  expect_null(buf$grow(e, TRUE))
  expect_equal(buf$size(), n + e)
  expect_equal(buf$used(), 0)

  b <- random_bytes(buf$size() * s)
  buf$push(b)
  expect_equal(buf$read(buf$size()), b)

  ## (2) partially full
  buf <- ring_buffer_bytes(n, s)
  b1 <- random_bytes(e * s)
  buf$push(b1)
  expect_equal(buf$data(), pad(b1, (n + 1) * s))

  buf$grow(e, TRUE)
  expect_equal(buf$size(), n + e)
  expect_equal(buf$used(), e)
  expect_equal(buf$data(), pad(b1, (n + e + 1) * s))

  b2 <- random_bytes(n * s)
  buf$push(b2)
  expect_equal(buf$read(n + e), c(b1, b2))

  ## (e) completely full
  buf <- ring_buffer_bytes(n, s)
  b1 <- random_bytes(n * s)
  buf$push(b1)
  buf$grow(e, TRUE)
  expect_equal(buf$size(), n + e)
  expect_equal(buf$used(), n)
  b2 <- random_bytes(e * s)
  buf$push(b2)
  expect_equal(buf$read(n + 3), c(b1, b2))
})

test_that("zero growth", {
  n <- 10
  s <- 6
  buf <- ring_buffer_bytes(n, s)
  b <- random_bytes(n * s)
  buf$push(b)
  for (exact in c(TRUE, FALSE)) {
    buf$grow(0, exact)
    expect_equal(buf$size(), n)
    expect_equal(buf$read(n), b)
    expect_equal(buf$head_pos(), n)
    expect_equal(buf$tail_pos(), 0)
  }
})

## Then growth, for which we also have to test where we get to, which
## is a bit more of a faff.  However, if the error is thrown correctly
## for all of the above tests, we should be able to get away with just
## running this for one and checking carefully it does the right thing.
test_that("overflow grow; set", {
  PHI <- 1.6180339887
  n <- 10
  s <- 6
  b <- ring_buffer_bytes(n, s, "grow")
  pat <- random_bytes(1)
  newlen <- ceiling(n * PHI)

  expect_equal(b$size(), n)
  expect_equal(b$set(pat, n + 1), n + 1)
  expect_equal(b$size(), newlen)
  expect_equal(b$size(TRUE), newlen * s)
  expect_equal(b$bytes_data(), (newlen + 1) * s)

  expect_equal(b$head_pos(), n + 1)
  expect_equal(b$tail_pos(), 0)
  expect_equal(b$used(), n + 1)
  expect_equal(b$free(), newlen - (n + 1))

  expect_equal(b$read(n + 1), rep(pat, (n + 1) * s))
  b$set(pat, 1)
  expect_equal(b$size(), newlen)

  ## Now, try and grow this a *lot* more and make sure that we
  ## increase size the right number of times.
  m <- 30 * n
  ceiling(newlen * PHI * ceiling(log((m + n + 2) / newlen, PHI)))

  newlen2 <- ceiling(newlen * PHI ^ ceiling(log((m + n + 2) / newlen, PHI)))
  b$set(pat, 30 * n)
  expect_equal(b$size(), newlen2)
  expect_equal(b$used(), m + n + 2)

  pat2 <- random_bytes(1)
  b2 <- ring_buffer_bytes(n, s, "grow")
  b2$set(pat, n)
  expect_equal(b2$take(n - 2), rep(pat, (n - 2) * s))
  b2$set(pat2, n - 2)
  expect_equal(b2$size(), n)
  expect_true(b2$is_full())
})

test_that("invalid overflow option", {
  expect_error(ring_buffer_bytes(10, 10, "g"),
               "Invalid value for 'on_overflow'")
  expect_error(ring_buffer_bytes(10, 10, NA),
               "Invalid value for 'on_overflow'")
  expect_error(ring_buffer_bytes(10, 10, "magic"),
               "Invalid value for 'on_overflow'")

  expect_error(ring_buffer_bytes(10, 10, 1),
               "on_overflow must be a character")
  expect_error(ring_buffer_bytes(10, 10, character(0)),
               "on_overflow must be a scalar")
})

test_that("grow geometrically by zero", {
  b <- ring_buffer_bytes(10, 6)
  b$grow(5)
  expect_equal(b$size(), 10)
  b$grow(10)
  expect_equal(b$size(), 10)
})

test_that("mirror", {
  size <- 128
  stride <- 8

  rb1 <- ring_buffer_bytes(size, stride)
  rb2 <- ring_buffer_bytes(size, stride)

  bb1 <- random_bytes(floor(size / 2) * stride)
  bb2 <- random_bytes(floor(size / 3) * stride)
  rb1$push(bb1)
  rb2$push(bb2)

  expect_error(rb1$mirror(rb1),
               "Can't mirror a buffer into itself")

  expect_equal(rb1$read(rb1$used()), bb1)
  expect_equal(rb2$read(rb2$used()), bb2)

  rb1$mirror(rb2)
  expect_equal(rb1$read(rb1$used()), bb1)
  expect_equal(rb1$read(rb1$used()), bb1)
  expect_equal(rb1$head_pos(), rb2$head_pos())
  expect_equal(rb1$tail_pos(), rb2$tail_pos())
  expect_equal(rb1$used(), rb2$used())

  ## Now rotate the buffer and try again:
  rb2$push(random_bytes((size + 5) * stride))
  rb2$take(4)
  bb3 <- rb2$read(rb2$used())

  rb2$mirror(rb1)
  expect_equal(rb1$read(rb1$used()), bb3)
  expect_equal(rb2$read(rb2$used()), bb3)
  expect_equal(rb1$head_pos(), rb2$head_pos())
  expect_equal(rb1$tail_pos(), rb2$tail_pos())
  expect_equal(rb1$used(), rb2$used())

  ## Try a couple of incompatible cases:
  expect_error(rb1$mirror(ring_buffer_bytes(size - 1, stride)),
               "Can't mirror as buffers differ in their size (128 vs 127)",
               fixed = TRUE)
  expect_error(rb1$mirror(ring_buffer_bytes(size, stride - 1)),
               "Can't mirror as buffers differ in their stride (8 vs 7)",
               fixed = TRUE)
  ## check even when bytes used would be about the same:
  expect_error(rb1$mirror(ring_buffer_bytes(size / 2, stride * 2)),
               "Can't mirror as buffers differ",
               fixed = TRUE)
})

test_that("reset", {
  rb <- ring_buffer_bytes(10)
  rb$push(as.raw(1:3))
  rb$push(as.raw(seq_len(rb$size())))

  rb$reset()
  expect_equal(rb$used(), 0)
  expect_true(rb$is_empty())
  expect_equal(rb$head_pos(), 0)
  expect_equal(rb$tail_pos(), 0)

  expect_equal(rb$data(), as.raw(c(9:10, 3, 1:8)))

  rb$reset(TRUE)
  expect_equal(rb$data(), rep(as.raw(0), rb$bytes_data()))
})

test_that("head set/advance", {
  stride <- 4
  n <- 10
  rb <- ring_buffer_bytes(n, stride)
  ## expect_equal(rb$head_data(), rep(as.raw(0), stride))
  d <- random_bytes(stride)
  rb$head_set(d)
  expect_equal(rb$head_data(), d)
  expect_equal(rb$data(), pad(d, (n + 1) * stride))
  expect_true(rb$is_empty())

  rb$head_advance()
  expect_false(rb$is_empty())
  expect_equal(rb$used(), 1)
  expect_equal(rb$tail(), d)

  expect_equal(rb$head_data(), rep(as.raw(0), stride))

  expect_error(rb$head_set(random_bytes(stride - 1)),
               "expected exactly 4 bytes")
  expect_error(rb$head_set(random_bytes(stride + 1)),
               "expected exactly 4 bytes")

  expect_equal(rb$head_data(), rep(as.raw(0), stride))
})

test_that("non-raw input", {
  stride <- 4
  n <- 10
  rb <- ring_buffer_bytes(n, stride)
  expect_error(rb$push(runif(stride)),
               "Expected a raw vector 'data'", fixed = TRUE)
})

test_that("invalid copy", {
  bytes <- as.raw(0:255)
  buf <- ring_buffer_bytes(length(bytes))
  expect_error(buf$copy(list(), 0),
               "'dest' must be a 'ring_buffer_bytes'", fixed = TRUE)
  expect_error(buf$copy(buf, 0),
               "Can't copy a buffer into itself", fixed = TRUE)
})

test_that("invalid mirror", {
  bytes <- as.raw(0:255)
  buf <- ring_buffer_bytes(length(bytes))
  expect_error(buf$mirror(list()),
               "'dest' must be a 'ring_buffer_bytes'", fixed = TRUE)
  expect_error(buf$mirror(buf),
               "Can't mirror a buffer into itself", fixed = TRUE)
})
