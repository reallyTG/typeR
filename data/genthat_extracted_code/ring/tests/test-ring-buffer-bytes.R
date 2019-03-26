## NOTE: There are a lot of tests here.  These are derived from the
## c-ringbuf/ringbuf-test.c file and exercise everything fairly
## carefully.  Unfortunately, having run through all of this we'll
## also have to do basically the same for the with-stride buffer too,
## along with any other corner cases that involves (which are likely
## to be many).

context("ring_buffer_bytes")

test_that("initial conditions", {
  size <- 100L

  buf <- ring_buffer_bytes(size)
  expect_is(buf, "ring_buffer_bytes")

  expect_equal(buf$size(), size)
  expect_equal(buf$stride(), 1L)

  expect_equal(buf$bytes_data(), size + 1L)
  expect_equal(buf$size(), size)
  expect_equal(buf$free(), 100L)
  expect_equal(buf$used(), 0L)
  expect_false(buf$is_full())
  expect_true(buf$is_empty())

  expect_equal(buf$head_pos(), 0L)
  expect_equal(buf$tail_pos(), 0L)

  expect_error(buf$head(), "Buffer is empty")
  expect_error(buf$tail(), "Buffer is empty")
  expect_null(buf$reset())

  expect_error(buf$take(10L), "Buffer underflow")

  rm(buf)
  gc() # no crash, ideally
})

test_that("null pointer safe", {
  path <- tempfile()
  saveRDS(ring_buffer_bytes(100), path)
  on.exit(file.remove(path))
  expect_error(readRDS(path)$is_full(), "ring_buffer already freed")
})

test_that("non-pointer safe", {
  expect_error(.Call(Cring_buffer_size, NULL, TRUE),
               "Expected an external pointer")
})

test_that("bad arguments are caught", {
  b <- ring_buffer_bytes(100)
  expect_error(b$size(1), "Expected a logical scalar")
  expect_error(b$size(logical(0)), "Expected a logical scalar")
  expect_error(b$size(NULL), "Expected a logical scalar")
  expect_error(b$size(pi), "Expected a logical scalar")
  expect_error(b$size(c(TRUE, FALSE)), "Expected a logical scalar")
  expect_error(b$size(NA), "Expected a non-missing logical scalar")

  b$push(as.raw(1:10))
  expect_error(b$read("a"), "Expected a nonnegative scalar integer")
  expect_error(b$read(-1), "Expected a nonnegative value")
  expect_error(b$read(NULL), "Expected a nonnegative scalar integer")
  expect_error(b$read(NA), "Expected a nonnegative scalar integer")
  expect_error(b$read(NA_integer_), "Expected a nonnegative value")
  expect_error(b$read(NA_real_), "Expected a nonnegative value")
  expect_error(b$read(1.5), "Expected an integer value")
})


test_that("reset", {
  size <- 24L
  for (write in c(8L, size + 1L)) {
    buf <- ring_buffer_bytes(size)
    expect_equal(buf$set(as.raw(1), write), write)
    expect_null(buf$reset())
    expect_equal(buf$bytes_data(), size + 1L)
    expect_equal(buf$size(), size)

    expect_equal(buf$free(), buf$size())
    expect_equal(buf$used(), 0L)

    expect_equal(buf$head_pos(), 0L)
    expect_equal(buf$tail_pos(), 0L)
  }
})

test_that("set with zero count", {
  size <- 24L
  buf <- ring_buffer_bytes(size)

  expect_equal(buf$set(as.raw(1), 0), 0)
  expect_equal(buf$size(), size)
  expect_equal(buf$free(), buf$size())
  expect_equal(buf$used(), 0)
  expect_false(buf$is_full())
  expect_true(buf$is_empty())
  expect_equal(buf$tail_pos(), buf$head_pos())
})

test_that("set a few bytes", {
  size <- 4096L

  buf <- ring_buffer_bytes(size)
  buf$reset()
  expect_equal(buf$set(as.raw(57), 7), 7)
  expect_equal(buf$size(), size)
  expect_equal(buf$free(), buf$size() - 7)
  expect_equal(buf$used(), 7)
  expect_false(buf$is_full())
  expect_false(buf$is_empty())

  expect_equal(buf$data(),
               pad(rep(as.raw(57), 7), size + 1))
})

test_that("set full capacity", {
  size <- 4096L
  buf <- ring_buffer_bytes(size)

  expect_equal(buf$set(as.raw(57), size), size)
  expect_equal(buf$size(), size)
  expect_equal(buf$free(), 0)
  expect_equal(buf$used(), buf$size())
  expect_true(buf$is_full())
  expect_false(buf$is_empty())
  expect_equal(buf$data(), pad(as.raw(rep(57, size)), size + 1))
})

test_that("set, twice", {
  size <- 4096L
  rb1 <- ring_buffer_bytes(size)

  rb1$reset()
  expect_equal(rb1$set(as.raw(57), 7), 7)
  expect_equal(rb1$set(as.raw(57), 15), 15)
  expect_equal(rb1$size(), size)
  expect_equal(rb1$used(), 7 + 15)
  expect_equal(rb1$free(),
               rb1$size() - (7 + 15))
  expect_false(rb1$is_full())
  expect_false(rb1$is_empty())

  expect_equal(rb1$data(),
               pad(rep(as.raw(57), 7 + 15), size + 1))
})

test_that("set, twice, to full capacity", {
  size <- 4096L
  rb1 <- ring_buffer_bytes(size)

  rb1$reset()
  expect_equal(rb1$set(as.raw(57), size - 1L), size - 1L)
  expect_equal(rb1$set(as.raw(57), 1L), 1L)
  expect_equal(rb1$size(), size)
  expect_equal(rb1$free(), 0)
  expect_equal(rb1$used(), size)
  expect_true(rb1$is_full())
  expect_false(rb1$is_empty())
  expect_equal(rb1$data(), pad(rep(as.raw(57), size), size + 1))
})

test_that("ring_buffer_set, overflow by 1 byte", {
  size <- 4096L
  rb1 <- ring_buffer_bytes(size)
  rb1$reset()

  expect_equal(rb1$set(as.raw(57), size + 1L), size + 1L)

  expect_equal(rb1$size(), size)
  expect_equal(rb1$free(), 0)
  expect_equal(rb1$used(), rb1$size())
  expect_true(rb1$is_full())
  expect_false(rb1$is_empty())
  ## head should point to the beginning of the buffer
  expect_equal(rb1$head_pos(), 0)
  ## tail should have bumped forward by 1 byte
  expect_equal(rb1$tail_pos(), 1L)
  expect_equal(rb1$data(), repr(57, size + 1))
})

test_that("ring_buffer_set, twice (overflow by 1 byte on 2nd copy)", {
  size <- 4096L
  rb1 <- ring_buffer_bytes(size)
  rb1$reset()

  expect_equal(rb1$set(as.raw(57), size), size)
  expect_equal(rb1$set(as.raw(57), 1L), 1L)
  expect_equal(rb1$size(), size)
  expect_equal(rb1$free(), 0)
  expect_equal(rb1$used(), rb1$size())
  expect_true(rb1$is_full())
  expect_false(rb1$is_empty())
  ## head should point to the beginning of the buffer
  expect_equal(rb1$head_pos(), 0)
  ## tail should have bumped forward by 1 byte
  expect_equal(rb1$tail_pos(), 1L)

  expect_equal(rb1$data(), repr(57, size + 1))
})

test_that("ring_buffer_set, twice with oveflow", {
  ## ring_buffer_set, attempt to overflow by 2 bytes, but
  ## ring_buffer_set will stop at 1 byte overflow (length
  ## clamping, see ring_buffer_set documentation).
  size <- 4096L
  rb1 <- ring_buffer_bytes(size)
  rb1$reset()

  expect_equal(rb1$set(as.raw(57), size + 2), size + 1L)
  expect_equal(rb1$size(), size)
  expect_equal(rb1$free(), 0)
  expect_equal(rb1$used(), rb1$size())
  expect_true(rb1$is_full())
  expect_false(rb1$is_empty())
  expect_equal(rb1$head_pos(), 0L)
  expect_equal(rb1$tail_pos(), 1L)
  expect_equal(rb1$data(), repr(57, size + 1))
})

test_that("ring_buffer_set, twice, overflowing both times", {
  size <- 4096L
  rb1 <- ring_buffer_bytes(size)
  rb1$reset()

  expect_equal(rb1$set(as.raw(57), size + 1L), size + 1L)
  expect_equal(rb1$set(as.raw(58), size + 1L), size + 1L)
  expect_equal(rb1$size(), size)
  expect_equal(rb1$free(), 0)
  expect_equal(rb1$used(), rb1$size())
  expect_true(rb1$is_full())
  expect_false(rb1$is_empty())
  expect_equal(rb1$head_pos(), 0L)
  expect_equal(rb1$tail_pos(), 1L)
  expect_equal(rb1$data(), repr(58, size + 1))
})

test_that("ring_buffer_push with zero count", {
  size <- 4096L
  rb1 <- ring_buffer_bytes(size)
  rb1$set(as.raw(1), rb1$bytes_data())
  rb1$reset()

  expect_equal(rb1$push(raw()),
               rb1$head_pos())
  expect_equal(rb1$size(), size)
  expect_equal(rb1$free(), rb1$size())
  expect_equal(rb1$used(), 0)
  expect_false(rb1$is_full())
  expect_true(rb1$is_empty())
  expect_equal(rb1$tail_pos(), rb1$head_pos())

  expect_equal(rb1$data(), repr(1, size + 1))
})

test_that("ring_buffer_push a few bytes of data", {
  size <- 4096L
  rb1 <- ring_buffer_bytes(size)
  rb1$set(as.raw(1), rb1$bytes_data())
  rb1$reset()

  bytes <- charToRaw("abcdefghijk")

  expect_equal(rb1$push(bytes),
               rb1$head_pos())

  expect_equal(rb1$size(), size)
  expect_equal(rb1$free(),
               rb1$size() - length(bytes))
  expect_equal(rb1$used(), length(bytes))
  expect_false(rb1$is_full())
  expect_false(rb1$is_empty())

  expect_equal(rb1$data(), pad(bytes, size + 1, 1))
})

test_that("ring_buffer_push full capacity", {
  size <- 4096L
  rb1 <- ring_buffer_bytes(size)
  rb1$set(as.raw(1), rb1$bytes_data())
  rb1$reset()

  bytes <- fill_buffer("abcdefghijk", (size + 1) * 2)

  expect_equal(rb1$push(bytes), 0L)
  expect_equal(rb1$head_pos(), 0L)
  expect_equal(rb1$size(), size)
  expect_equal(rb1$free(), 0L)
  expect_equal(rb1$used(), rb1$size())
  expect_true(rb1$is_full())
  expect_false(rb1$is_empty())

  expect_equal(rb1$read(size), tail(bytes, size))

  ## NOTE: I'm a bit confused about this, though, the data doesn't
  ## seem quite what I'd expect for the buffer to hold.
  res <- rb1$data()
  i <- rb1$tail_pos()
  expect_equal(i, 1L)
  j <- seq_len(i)
  ## expect_equal(c(res[-i], res[i]),
  ##              rb1$read(size))
})

test_that("ring_buffer_push, twice", {
  size <- 4096L
  rb1 <- ring_buffer_bytes(size)
  rb1$set(as.raw(1), rb1$bytes_data())
  rb1$reset()

  bytes <- charToRaw("abcdefghijk")

  expect_equal(rb1$push(bytes), length(bytes))
  expect_equal(rb1$push(bytes), length(bytes) * 2)

  expect_equal(rb1$size(), size)
  expect_equal(rb1$free(),
               rb1$size() - (2 * length(bytes)))

  expect_false(rb1$is_full())
  expect_false(rb1$is_empty())

  expect_equal(rb1$read(length(bytes) * 2),
               rep(bytes, 2))
  expect_equal(rb1$data(),
               pad(rep(bytes, 2), size + 1, 1))
  expect_equal(rb1$head(), tail(bytes, 1))
})

test_that("ring_buffer_push, twice (to full capacity)", {
  size <- 4096L
  rb1 <- ring_buffer_bytes(size)
  rb1$set(as.raw(1), rb1$bytes_data())
  rb1$reset()

  bytes <- fill_buffer("abcdefghijk", size)

  expect_equal(rb1$push(bytes[seq_len(size - 1L)]),
               size - 1L)
  expect_equal(rb1$head_pos(), size - 1L)

  expect_equal(rb1$push(bytes[size]), size)
  expect_equal(rb1$head_pos(), size)

  expect_equal(rb1$size(), size)
  expect_equal(rb1$free(), 0)
  expect_true(rb1$is_full())
  expect_false(rb1$is_empty())

  expect_equal(head(rb1$data(), size), bytes)
})

test_that("ring_buffer_push, overflow by 1 byte", {
  size <- 4096L
  rb1 <- ring_buffer_bytes(size)
  rb1$set(as.raw(1), rb1$bytes_data())
  rb1$reset()

  bytes <- fill_buffer("abcdefghijk", size + 1)

  expect_equal(rb1$push(bytes), 0L)
  expect_equal(rb1$head_pos(), 0L)

  expect_equal(rb1$size(), size)
  expect_equal(rb1$free(), 0)
  expect_equal(rb1$used(), rb1$size())
  expect_true(rb1$is_full())
  expect_false(rb1$is_empty())

  ## head should point to the beginning of the buffer
  expect_equal(rb1$head_pos(), 0L)
  ## tail should have bumped forward by 1 byte
  expect_equal(rb1$tail_pos(), 1)

  expect_equal(rb1$read(size), bytes[-1L])
})

test_that("ring_buffer_push, twice (overflow by 1 byte on 2nd copy)", {
  size <- 4096L
  rb1 <- ring_buffer_bytes(size)
  rb1$set(as.raw(1), rb1$bytes_data())
  rb1$reset()

  bytes <- fill_buffer("abcdefghijk", size + 1L)

  i <- seq_len(size)

  expect_equal(rb1$push(bytes[i]), size)
  expect_equal(rb1$head_pos(), size)

  expect_equal(rb1$push(bytes[-i]), 0L)
  expect_equal(rb1$head_pos(), 0L)

  expect_equal(rb1$size(), size)
  expect_equal(rb1$free(), 0)
  expect_equal(rb1$used(), rb1$size())
  expect_true(rb1$is_full())
  expect_false(rb1$is_empty())

  ## head should point to the beginning of the buffer
  expect_equal(rb1$head_pos(), 0L)
  ## tail should have bumped forward by 1 byte
  expect_equal(rb1$tail_pos(), 1L)

  expect_equal(rb1$read(size), bytes[-1L])
})

test_that("ring_buffer_push, overflow by 2 bytes (will wrap)", {
  size <- 4096L
  rb1 <- ring_buffer_bytes(size)
  rb1$set(as.raw(1), rb1$bytes_data())
  rb1$reset()

  bytes <- fill_buffer("abcdefghijk", size + 2L)

  expect_equal(rb1$push(bytes), 1L)
  expect_equal(rb1$head_pos(), 1L)

  expect_equal(rb1$size(), size)
  expect_equal(rb1$free(), 0L)
  expect_equal(rb1$used(), rb1$size())
  expect_true(rb1$is_full())
  expect_false(rb1$is_empty())
  expect_equal(rb1$head_pos(), 1L)
  expect_equal(rb1$tail_pos(), 2L)

  expect_equal(rb1$read(size), bytes[-(1:2)])
})

test_that("ring_buffer_take with zero count, empty ring buffer", {
  size <- 4096L
  rb1 <- ring_buffer_bytes(size)
  rb1$set(as.raw(1), rb1$bytes_data())
  rb1$reset()

  expect_equal(rb1$take(0L), raw())
  expect_equal(rb1$tail_pos(), 0L)
  expect_equal(rb1$size(), size)
  expect_equal(rb1$free(), rb1$size())
  expect_equal(rb1$used(), 0)
  expect_false(rb1$is_full())
  expect_true(rb1$is_empty())
  expect_equal(rb1$tail_pos(), rb1$head_pos())
  expect_equal(rb1$tail_pos(), 0L)
})

test_that("ring_buffer_take with zero count, non-empty ring buffer", {
  size <- 4096L
  rb1 <- ring_buffer_bytes(size)
  rb1$set(as.raw(1), rb1$bytes_data())
  rb1$reset()

  bytes <- charToRaw("0123456789A")

  rb1$push(bytes)
  expect_equal(rb1$take(0L), raw())

  expect_equal(rb1$size(), size)
  expect_equal(rb1$free(),
               rb1$size() - length(bytes))

  expect_equal(rb1$used(), length(bytes))
  expect_false(rb1$is_full())
  expect_false(rb1$is_empty())
  expect_equal(rb1$tail_pos(), 0L)
})

test_that("ring_buffer_take a few bytes of data", {
  size <- 4096L
  rb1 <- ring_buffer_bytes(size)
  rb1$set(as.raw(1), rb1$bytes_data())
  rb1$reset()

  bytes <- charToRaw("0123456789A")

  rb1$push(bytes)

  dat <- rb1$take(3L)
  expect_equal(dat, bytes[1:3])
  expect_that(rb1$tail_pos(), equals(3L))

  expect_equal(rb1$size(), size)
  expect_equal(rb1$free(),
               rb1$size() - (length(bytes) - 3L))
  expect_equal(rb1$used(), length(bytes) - 3L)
  expect_false(rb1$is_full())
  expect_false(rb1$is_empty())
  expect_equal(rb1$tail_pos(), 3L)

  expect_equal(rb1$head_pos(),
               rb1$tail_pos() + (length(bytes) - 3L))
  expect_equal(rb1$read(length(bytes) - 3L), bytes[-(1:3)])
  expect_equal(rb1$data(), pad(bytes, size + 1, 1))
})

test_that("ring_buffer_take full capacity", {
  size <- 4096L
  rb1 <- ring_buffer_bytes(size)
  rb1$set(as.raw(1), rb1$bytes_data())
  rb1$reset()

  bytes <- fill_buffer("0123456789A", size)
  rb1$push(bytes)

  dat <- rb1$take(size)

  expect_equal(dat, bytes)

  expect_equal(rb1$size(), size)
  expect_equal(rb1$free(), rb1$size())
  expect_equal(rb1$used(), 0)
  expect_false(rb1$is_full())
  expect_true(rb1$is_empty())
  expect_equal(rb1$tail_pos(), rb1$head_pos())
  expect_equal(rb1$head_pos(), size)
})

test_that("ring_buffer_take, twice", {
  size <- 4096L
  rb1 <- ring_buffer_bytes(size)
  rb1$set(as.raw(1), rb1$bytes_data())
  rb1$reset()

  bytes <- fill_buffer("0123456789A", 13)

  rb1$push(bytes)
  expect_equal(rb1$take(9L), bytes[1:9])
  expect_equal(rb1$take(4L), bytes[-(1:9)])
  expect_equal(rb1$size(), size)
  expect_equal(rb1$free(), rb1$size())
  expect_equal(rb1$used(), 0)
  expect_false(rb1$is_full())
  expect_true(rb1$is_empty())
  expect_equal(rb1$tail_pos(), rb1$head_pos())
  expect_equal(rb1$tail_pos(), 13)
})

test_that("ring_buffer_take, twice (full capacity)", {
  size <- 4096L
  rb1 <- ring_buffer_bytes(size)
  rb1$set(as.raw(1), rb1$bytes_data())
  rb1$reset()

  bytes <- fill_buffer("0123456789A", size)
  rb1$push(bytes)

  expect_equal(rb1$take(size - 1L),
               bytes[-size])
  expect_equal(rb1$take(1L),
               bytes[size])

  expect_equal(rb1$size(), size)
  expect_equal(rb1$free(), rb1$size())
  expect_equal(rb1$used(), 0)
  expect_false(rb1$is_full())
  expect_true(rb1$is_empty())
  expect_equal(rb1$tail_pos(), rb1$head_pos())
  expect_equal(rb1$tail_pos(), size)
})

test_that("ring_buffer_take, attempt to underflow", {
  size <- 4096L
  rb1 <- ring_buffer_bytes(size)
  rb1$set(as.raw(1), rb1$bytes_data())
  rb1$reset()

  bytes <- fill_buffer("0123456789A", 15)
  rb1$push(bytes)

  expect_error(rb1$take(16L),
               "Buffer underflow (requested 16 elements but 15 available)",
               fixed = TRUE)

  expect_equal(rb1$size(), size)
  expect_equal(rb1$free(), rb1$size() - 15)
  expect_equal(rb1$used(), 15)
  expect_false(rb1$is_full())
  expect_false(rb1$is_empty())
  expect_equal(rb1$tail_pos(), 0L)
  expect_equal(rb1$head_pos(), 15)
})

test_that("ring_buffer_take, attempt to underflow on 2nd call", {
  size <- 4096L
  rb1 <- ring_buffer_bytes(size)
  rb1$set(as.raw(1), rb1$bytes_data())
  rb1$reset()

  bytes <- fill_buffer("0123456789A", 15)
  rb1$push(bytes)

  expect_equal(rb1$take(14L), bytes[-15])
  expect_error(rb1$take(2L),
               "Buffer underflow (requested 2 elements but 1 available)",
               fixed = TRUE)

  expect_equal(rb1$size(), size)
  expect_equal(rb1$free(), rb1$size() - 1)
  expect_equal(rb1$used(), 1)
  expect_false(rb1$is_full())
  expect_false(rb1$is_empty())
  expect_equal(rb1$tail_pos(), 14)
  expect_equal(rb1$head_pos(), 15)
})

test_that("ring_buffer_push followed by ring_buffer_take", {
  size <- 4096L
  rb1 <- ring_buffer_bytes(size)
  rb1$set(as.raw(1), rb1$bytes_data())
  rb1$reset()

  bytes <- charToRaw("0123456789A")
  expect_equal(rb1$push(bytes), length(bytes))
  expect_equal(rb1$take(11), bytes)

  expect_equal(rb1$size(), size)
  expect_equal(rb1$free(), rb1$size())
  expect_equal(rb1$used(), 0)
  expect_false(rb1$is_full())
  expect_true(rb1$is_empty())

  expect_equal(rb1$data(), pad(bytes, size + 1, 1))
  expect_equal(rb1$tail_pos(), length(bytes))
  expect_equal(rb1$tail_pos(), rb1$head_pos())
})

test_that("ring_buffer_push, partial ring_buffer_take", {
  size <- 4096L
  rb1 <- ring_buffer_bytes(size)
  rb1$set(as.raw(1), rb1$bytes_data())
  rb1$reset()

  bytes <- charToRaw("0123456789A")
  expect_equal(rb1$push(bytes), length(bytes))

  expect_equal(rb1$take(7), bytes[1:7])

  expect_equal(rb1$size(), size)
  expect_equal(rb1$free(), rb1$size() - 4)
  expect_equal(rb1$used(), 4)
  expect_false(rb1$is_full())
  expect_false(rb1$is_empty())

  expect_equal(rb1$read(4), tail(bytes, 4))
  expect_equal(rb1$tail_pos(), 7)
  expect_equal(rb1$head_pos(), 11)
})

test_that("ring_buffer_push, from, into, no wrap", {
  size <- 4096L
  rb1 <- ring_buffer_bytes(size)
  rb1$set(as.raw(1), rb1$bytes_data())
  rb1$reset()

  len <- 11
  i <- seq_len(len)
  bytes <- fill_buffer("0123456789A", size)

  expect_equal(rb1$push(bytes[i]), length(i))
  expect_equal(rb1$take(length(i)), bytes[i])

  expect_equal(rb1$push(bytes[-i]), size)

  expect_equal(rb1$size(), size)
  expect_equal(rb1$free(), length(i))

  expect_equal(rb1$used(), size - length(i))
  expect_false(rb1$is_full())
  expect_false(rb1$is_empty())
  expect_equal(rb1$tail_pos(), 11)
  expect_equal(rb1$head_pos(), size)
})

test_that("ring_buffer_push, from, into, no wrap", {
  ## ring_buffer_push, ring_buffer_take, then
  ## ring_buffer_push to the end of the contiguous buffer,
  ## which should cause the head pointer to wrap.
  size <- 4096L
  rb1 <- ring_buffer_bytes(size)
  rb1$set(as.raw(1), rb1$bytes_data())
  rb1$reset()

  len <- 11
  i <- seq_len(len)
  bytes <- fill_buffer("0123456789A", size + 1)

  expect_equal(rb1$push(bytes[i]), length(i))
  expect_equal(rb1$take(length(i)), bytes[i])

  expect_equal(rb1$push(bytes[-i]), 0L)
  expect_equal(rb1$size(), size)
  expect_equal(rb1$free(), 10)
  expect_equal(rb1$used(), size - 10)
  expect_false(rb1$is_full())
  expect_false(rb1$is_empty())
  expect_equal(rb1$tail_pos(), 11)
  expect_equal(rb1$head_pos(), 0L)
})

test_that("ring_buffer_push, overflow when tail > head", {
  ## Overflow with ring_buffer_push when tail pointer is > head
  ## pointer. Should bump tail pointer to head + 1.
  size <- 4096L
  rb1 <- ring_buffer_bytes(size)
  rb1$set(as.raw(1), rb1$bytes_data())
  rb1$reset()

  len <- 11
  i <- seq_len(len)
  j <- seq(max(i) + 1, length.out = size - len + 1L)
  k <- seq(max(j) + 1, length.out = len)
  bytes <- fill_buffer("0123456789A", max(k))

  expect_equal(rb1$push(bytes[i]), len)
  expect_equal(rb1$take(len), bytes[i])

  ## wrap head
  expect_equal(rb1$push(bytes[j]), 0L)

  ## overflow
  expect_equal(rb1$push(bytes[k]), len)

  expect_equal(rb1$size(), size)
  expect_equal(rb1$free(), 0)
  expect_equal(rb1$used(), size)
  expect_true(rb1$is_full())
  expect_false(rb1$is_empty())

  expect_equal(rb1$head_pos(), 11)
  expect_equal(rb1$tail_pos(), 12)
})

test_that("ring_buffer_push, overflow with tail at end", {
  ## Overflow with ring_buffer_push when tail pointer is > head
  ## pointer, and tail pointer is at the end of the contiguous
  ## buffer. Should wrap tail pointer to beginning of contiguous
  ## buffer.
  size <- 4096L
  rb1 <- ring_buffer_bytes(size)
  rb1$set(as.raw(1), rb1$bytes_data())
  rb1$reset()

  len <- 11
  i <- seq_len(len)
  j <- seq(max(i) + 1, length.out = size - len + 1L)
  k <- seq(max(j) + 1, length.out = size)
  bytes <- fill_buffer("0123456789A", max(k))

  expect_equal(rb1$push(bytes[i]), len)
  expect_equal(rb1$take(len), bytes[i])

  ## wrap head
  expect_equal(rb1$push(bytes[j]), 0L)

  ## copy from until tail points to end of contiguous buffer
  expect_equal(rb1$take(length(j) - 1L),
               bytes[j[-length(j)]])

  expect_equal(rb1$tail_pos(), size)

  ## overflow
  expect_equal(rb1$push(bytes[k]), size)

  expect_equal(rb1$size(), size)
  expect_equal(rb1$free(), 0)
  expect_equal(rb1$used(), size)
  expect_true(rb1$is_full())
  expect_false(rb1$is_empty())
  expect_equal(rb1$head_pos(), size)
  expect_equal(rb1$tail_pos(), 0L)
})

test_that("ring_buffer_copy with zero count, empty buffers", {
  size <- 4096L
  rb1 <- ring_buffer_bytes(size)
  rb2 <- ring_buffer_bytes(size)

  rb1$set(as.raw(1), rb1$bytes_data())
  rb1$set(as.raw(2), rb2$bytes_data())
  rb1$reset()
  rb2$reset()

  expect_equal(rb2$copy(rb1, 0L), 0L)

  expect_equal(rb1$size(), size)
  expect_equal(rb2$size(), size)
  expect_equal(rb1$free(), rb1$size())
  expect_equal(rb2$free(), rb2$size())
  expect_equal(rb1$used(), 0L)
  expect_equal(rb2$used(), 0L)
  expect_false(rb1$is_full())
  expect_false(rb2$is_full())
  expect_true(rb1$is_empty())
  expect_true(rb2$is_empty())
  expect_equal(rb1$tail_pos(), rb1$head_pos())
  expect_equal(rb2$tail_pos(), rb2$head_pos())
  expect_equal(rb1$head_pos(), 0L)
  expect_equal(rb2$head_pos(), 0L)
})

test_that("ring_buffer_copy with zero count, empty src", {
  size <- 4096L
  rb1 <- ring_buffer_bytes(size)
  rb2 <- ring_buffer_bytes(size)

  rb1$set(as.raw(1), rb1$bytes_data())
  rb1$set(as.raw(2), rb2$bytes_data())
  rb1$reset()
  rb2$reset()

  bytes <- random_bytes(2)

  expect_equal(rb1$push(bytes), 2L)
  expect_equal(rb2$copy(rb1, 0L), 2L)

  expect_equal(rb1$size(), size)
  expect_equal(rb2$size(), size)
  expect_equal(rb1$free(), rb1$size() - 2L)
  expect_equal(rb2$free(), rb2$size())
  expect_equal(rb1$used(), 2L)
  expect_equal(rb2$used(), 0L)
  expect_false(rb1$is_full())
  expect_false(rb2$is_full())
  expect_false(rb1$is_empty())
  expect_true(rb2$is_empty())
  expect_equal(rb1$tail_pos(), 0L)
  expect_equal(rb2$tail_pos(), rb2$head_pos())
  expect_equal(rb1$head_pos(), 2L)
  expect_equal(rb2$head_pos(), 0L)
})

test_that("ring_buffer_copy with zero count, empty dst", {
  size <- 4096L
  rb1 <- ring_buffer_bytes(size)
  rb2 <- ring_buffer_bytes(size)

  rb1$set(as.raw(1), rb1$bytes_data())
  rb1$set(as.raw(2), rb2$bytes_data())
  rb1$reset()
  rb2$reset()

  bytes <- random_bytes(2)

  expect_equal(rb2$push(bytes), 2L)
  expect_equal(rb2$copy(rb1, 0L), 0L)

  expect_equal(rb1$size(), size)
  expect_equal(rb2$size(), size)
  expect_equal(rb1$free(), rb1$size())
  expect_equal(rb2$free(), rb2$size() - 2L)
  expect_equal(rb1$used(), 0L)
  expect_equal(rb2$used(), 2L)
  expect_false(rb1$is_full())
  expect_false(rb2$is_full())
  expect_true(rb1$is_empty())
  expect_false(rb2$is_empty())
  expect_equal(rb1$tail_pos(), rb1$head_pos())
  expect_equal(rb2$tail_pos(), 0L)
  expect_equal(rb1$head_pos(), 0L)
  expect_equal(rb2$head_pos(), 2L)
})

test_that("ring_buffer_copy with zero count", {
  size <- 4096L
  rb1 <- ring_buffer_bytes(size)
  rb2 <- ring_buffer_bytes(size)

  rb1$set(as.raw(1), rb1$bytes_data())
  rb1$set(as.raw(2), rb2$bytes_data())
  rb1$reset()
  rb2$reset()

  bytes1 <- random_bytes(2)
  bytes2 <- random_bytes(2)

  expect_equal(rb1$push(bytes1), 2L)
  expect_equal(rb2$push(bytes2), 2L)
  expect_equal(rb2$copy(rb1, 0), 2L)
  expect_equal(rb1$size(), size)
  expect_equal(rb2$size(), size)
  expect_equal(rb1$free(), rb1$size() - 2)
  expect_equal(rb2$free(), rb2$size() - 2)
  expect_equal(rb1$used(), 2)
  expect_equal(rb2$used(), 2)
  expect_false(rb1$is_full())
  expect_false(rb2$is_full())
  expect_false(rb1$is_empty())
  expect_false(rb2$is_empty())
  expect_equal(rb1$tail_pos(), 0L)
  expect_equal(rb2$tail_pos(), 0L)
  expect_equal(rb1$head_pos(), 2)
  expect_equal(rb2$head_pos(), 2)
})

test_that("ring_buffer_copy full contents of rb2 into rb1 (from empty)", {
  size <- 4096L
  rb1 <- ring_buffer_bytes(size)
  rb2 <- ring_buffer_bytes(size)

  rb1$set(as.raw(1), rb1$bytes_data())
  rb1$set(as.raw(2), rb2$bytes_data())
  rb1$reset()
  rb2$reset()

  bytes <- random_bytes(2)
  expect_equal(rb2$push(bytes), 2L)

  expect_equal(rb2$copy(rb1, 2), 2L)

  expect_equal(rb1$size(), size)
  expect_equal(rb2$size(), size)
  expect_equal(rb1$free(), rb1$size() - 2)
  expect_equal(rb2$free(), rb2$size())
  expect_equal(rb1$used(), 2)
  expect_equal(rb2$used(), 0)
  expect_false(rb1$is_full())
  expect_false(rb2$is_full())
  expect_false(rb1$is_empty())
  expect_true(rb2$is_empty())
  expect_equal(rb1$tail_pos(), 0L)
  expect_equal(rb2$tail_pos(), 2)
  expect_equal(rb1$head_pos(), 2)
  expect_equal(rb2$head_pos(), 2)

  expect_equal(rb1$read(2), bytes)
})

test_that("ring_buffer_copy full contents of rb2 into rb1", {
  ## (latter initially has 3 bytes)
  size <- 4096L
  rb1 <- ring_buffer_bytes(size)
  rb2 <- ring_buffer_bytes(size)

  rb1$set(as.raw(1), rb1$bytes_data())
  rb1$set(as.raw(2), rb2$bytes_data())
  rb1$reset()
  rb2$reset()

  n1 <- 3
  n2 <- 2
  nn <- n1 + n2
  bytes1 <- random_bytes(n1)
  bytes2 <- random_bytes(n2)

  expect_equal(rb1$push(bytes1), n1)
  expect_equal(rb2$push(bytes2), n2)

  expect_equal(rb2$copy(rb1, n2), nn)
  expect_equal(rb1$size(), size)
  expect_equal(rb2$size(), size)
  expect_equal(rb1$free(), rb1$size() - nn)
  expect_equal(rb2$free(), rb2$size())
  expect_equal(rb1$used(), nn)
  expect_equal(rb2$used(), 0)
  expect_false(rb1$is_full())
  expect_false(rb2$is_full())
  expect_false(rb1$is_empty())
  expect_true(rb2$is_empty())
  expect_equal(rb1$tail_pos(), 0L)
  expect_equal(rb2$tail_pos(), n2)
  expect_equal(rb1$head_pos(), nn)
  expect_equal(rb2$head_pos(), n2)

  expect_equal(rb1$read(nn), c(bytes1, bytes2))
})

test_that("ring_buffer_copy, wrap head of dst", {
  ## (latter initially has 3 bytes)
  size <- 4096L
  rb1 <- ring_buffer_bytes(size)
  rb2 <- ring_buffer_bytes(size)

  rb1$set(as.raw(1), rb1$bytes_data())
  rb1$set(as.raw(2), rb2$bytes_data())
  rb1$reset()
  rb2$reset()

  bytes1 <- random_bytes(size)
  bytes2 <- random_bytes(1)

  expect_equal(rb1$push(bytes1), size)
  expect_equal(rb1$head_pos(), size)

  ## make sure rb1 doesn't overflow on later ring_buffer_copy
  expect_equal(rb1$take(1), bytes1[1])
  expect_equal(rb1$tail_pos(), 1)

  expect_equal(rb2$push(bytes2), 1L)

  expect_equal(rb2$copy(rb1, 1L), 0L)

  expect_equal(rb1$size(), size)
  expect_equal(rb2$size(), size)
  expect_equal(rb1$free(), 0L)
  expect_equal(rb2$free(), rb2$size())
  expect_equal(rb1$used(), size)
  expect_equal(rb2$used(), 0L)
  expect_true(rb1$is_full())
  expect_false(rb2$is_full())
  expect_false(rb1$is_empty())
  expect_true(rb2$is_empty())
  expect_equal(rb1$tail_pos(), 1)
  expect_equal(rb2$tail_pos(), 1)
  expect_equal(rb1$head_pos(), 0L)
  expect_equal(rb2$head_pos(), 1)

  expect_equal(rb1$read(size), c(bytes1[-1], bytes2))
})

test_that("ring_buffer_copy, wrap head of dst and continue", {
  size <- 4096L
  rb1 <- ring_buffer_bytes(size)
  rb2 <- ring_buffer_bytes(size)

  rb1$set(as.raw(1), rb1$bytes_data())
  rb1$set(as.raw(2), rb2$bytes_data())
  rb1$reset()
  rb2$reset()

  n2 <- 2
  bytes1 <- random_bytes(size)
  bytes2 <- random_bytes(n2)

  expect_equal(rb1$push(bytes1), size)
  expect_equal(rb1$head_pos(), size)

  ## make sure rb1 doesn't overflow on later ring_buffer_copy
  expect_equal(rb1$take(n2),
               bytes1[seq_len(n2)])
  expect_equal(rb1$tail_pos(), n2)

  expect_equal(rb2$push(bytes2), n2)

  expect_equal(rb2$copy(rb1, n2), 1L)

  expect_equal(rb1$size(), size)
  expect_equal(rb2$size(), size)
  expect_equal(rb1$free(), 0L)
  expect_equal(rb2$free(), rb2$size())
  expect_equal(rb1$used(), size)
  expect_equal(rb2$used(), 0L)
  expect_true(rb1$is_full())
  expect_false(rb2$is_full())
  expect_false(rb1$is_empty())
  expect_true(rb2$is_empty())
  expect_equal(rb1$tail_pos(), 2)
  expect_equal(rb2$tail_pos(), 2)
  expect_equal(rb1$head_pos(), 1)
  expect_equal(rb2$head_pos(), 2)

  expect_equal(rb1$read(size),
               c(bytes1[-seq_len(n2)], bytes2))
})

test_that("ring_buffer_copy, wrap tail of src", {
  ## ring_buffer_copy, wrap head of dst and continue copying into
  ## start of contiguous buffer
  size <- 4096L
  rb1 <- ring_buffer_bytes(size)
  rb2 <- ring_buffer_bytes(size)

  rb1$set(as.raw(1), rb1$bytes_data())
  rb1$set(as.raw(2), rb2$bytes_data())
  rb1$reset()
  rb2$reset()

  bytes <- random_bytes(size)
  n <- 2L
  n1 <- size - n
  bytes2 <- random_bytes(n)

  expect_equal(rb2$push(bytes), size)
  expect_equal(rb2$head_pos(), size)

  expect_equal(rb2$take(n1), bytes[seq_len(n1)])
  expect_equal(rb2$tail_pos(), n1)

  expect_equal(rb2$push(bytes2), n - 1L)
  expect_equal(rb2$head_pos(), n - 1L)

  cmp <- rb2$read(3)
  expect_equal(cmp, c(bytes, bytes2)[-seq_len(n1)][seq_len(3)])

  expect_equal(rb2$copy(rb1, 3L), 3L)

  expect_equal(rb1$size(), size)
  expect_equal(rb2$size(), size)
  expect_equal(rb1$free(), size - 3)
  expect_equal(rb2$free(), size - 1)
  expect_equal(rb1$used(), 3)
  expect_equal(rb2$used(), 1)
  expect_false(rb1$is_full())
  expect_false(rb2$is_full())
  expect_false(rb1$is_empty())
  expect_false(rb2$is_empty())
  expect_equal(rb1$tail_pos(), 0L)
  expect_equal(rb2$tail_pos(), 0L)
  expect_equal(rb1$head_pos(), 3)
  expect_equal(rb2$head_pos(), 1)

  expect_equal(rb1$read(3), cmp)
  expect_equal(rb2$read(1), tail(bytes2, 1))
})

test_that("ring_buffer_copy, wrap tail of src and head of dst...", {
  ##  simultaneously, then continue copying from start of contiguous buffer
  size <- 4096L
  rb1 <- ring_buffer_bytes(size)
  rb2 <- ring_buffer_bytes(size)

  rb1$set(as.raw(1), rb1$bytes_data())
  rb1$set(as.raw(2), rb2$bytes_data())
  rb1$reset()
  rb2$reset()

  bytes1 <- random_bytes(size)
  bytes2 <- random_bytes(2)
  bytes3 <- random_bytes(size - 2)

  expect_equal(rb2$push(bytes1), size)
  expect_equal(rb2$head_pos(), size)

  expect_equal(rb2$take(size - 2),
               bytes1[seq_len(size - 2)])
  expect_equal(rb2$tail_pos(), size - 2)

  expect_equal(rb2$push(bytes2), 1L)

  expect_equal(rb1$push(bytes3), length(bytes3))
  expect_equal(rb1$head_pos(), length(bytes3))

  expect_equal(rb1$take(length(bytes3)), bytes3)
  expect_equal(rb1$tail_pos(), size - 2)

  expect_equal(rb2$copy(rb1, 4), 1L)

  expect_equal(rb1$size(), size)
  expect_equal(rb2$size(), size)
  expect_equal(rb1$free(), size - 4)
  expect_equal(rb2$free(), size)
  expect_equal(rb1$used(), 4)
  expect_equal(rb2$used(), 0)
  expect_false(rb1$is_full())
  expect_false(rb2$is_full())
  expect_false(rb1$is_empty())
  expect_true(rb2$is_empty())
  expect_equal(rb1$tail_pos(), size - 2)
  expect_equal(rb2$tail_pos(), 1)
  expect_equal(rb1$head_pos(), 1)
  expect_equal(rb2$head_pos(), 1)

  expect_equal(rb1$read(4),
               c(tail(bytes1, 2), bytes2))
})

test_that("ring_buffer_copy, force 3 separate memcpy's...", {
  ## up to end of src, then up to end of dst, then copy remaining bytes.
  size <- 4096L
  rb1 <- ring_buffer_bytes(size)
  rb2 <- ring_buffer_bytes(size)

  rb1$set(as.raw(1), rb1$bytes_data())
  rb1$set(as.raw(2), rb2$bytes_data())
  rb1$reset()
  rb2$reset()

  bytes1 <- random_bytes(size)
  bytes2 <- random_bytes(5)
  bytes3 <- random_bytes(size - 2)

  expect_equal(rb2$push(bytes1), size)
  expect_equal(rb2$head_pos(), size)

  expect_equal(rb2$take(size - 1), bytes1[-size])
  expect_equal(rb2$tail_pos(), size - 1)

  expect_equal(rb2$push(bytes2), length(bytes2) - 1L)

  expect_equal(rb1$push(bytes3), length(bytes3))
  expect_equal(rb1$head_pos(), length(bytes3))

  expect_equal(rb1$take(size - 3),
               bytes3[seq_len(size - 3)])
  expect_equal(rb1$tail_pos(), size - 3)

  expect_equal(rb2$copy(rb1, 5), 2L)

  expect_equal(rb1$size(), size)
  expect_equal(rb2$size(), size)
  expect_equal(rb1$free(), size - 6)
  expect_equal(rb2$free(), size - 1)
  expect_equal(rb1$used(), 6)
  expect_equal(rb2$used(), 1)
  expect_false(rb1$is_full())
  expect_false(rb2$is_full())
  expect_false(rb1$is_empty())
  expect_false(rb2$is_empty())
  expect_equal(rb1$tail_pos(), size - 3)
  expect_equal(rb2$tail_pos(), 3)
  expect_equal(rb1$head_pos(), 2)
  expect_equal(rb2$head_pos(), 4)

  ## one byte from buf, 5 bytes from buf2, 3 at end of contiguous
  ## buffer and 2 after the wrap
  dat <- rb1$read(6)
  expect_equal(dat, c(tail(bytes3, 1), tail(bytes1, 1), head(bytes2, 4)))
})

test_that("ring_buffer_copy overflow", {
  ## up to end of src, then up to end of dst, then copy remaining bytes.
  size <- 4096L
  rb1 <- ring_buffer_bytes(size)
  rb2 <- ring_buffer_bytes(size)

  rb1$set(as.raw(1), rb1$bytes_data())
  rb1$set(as.raw(2), rb2$bytes_data())
  rb1$reset()
  rb2$reset()

  bytes1 <- random_bytes(size)
  bytes2 <- random_bytes(2)

  expect_equal(rb1$push(bytes1), size)
  expect_equal(rb1$head_pos(), size)
  expect_equal(rb1$tail_pos(), 0L)

  expect_equal(rb2$push(bytes2), 2L)

  expect_equal(rb2$copy(rb1, 2), 1L)

  expect_equal(rb1$size(), size)
  expect_equal(rb2$size(), size)
  expect_equal(rb1$free(), 0)
  expect_equal(rb2$free(), rb2$size())
  expect_equal(rb1$used(), size)
  expect_equal(rb2$used(), 0)
  expect_true(rb1$is_full())
  expect_false(rb2$is_full())
  expect_false(rb1$is_empty())
  expect_true(rb2$is_empty())
  expect_equal(rb1$tail_pos(), 2)
  expect_equal(rb2$tail_pos(), 2)
  expect_equal(rb1$head_pos(), 1)
  expect_equal(rb2$head_pos(), 2)

  i <- seq_along(bytes2)
  expect_equal(rb1$read(size),
               c(bytes1[-i], bytes2))
})

test_that("ring_buffer_copy attempted underflow", {
  ## up to end of src, then up to end of dst, then copy remaining bytes.
  size <- 4096L
  rb1 <- ring_buffer_bytes(size)
  rb2 <- ring_buffer_bytes(size)

  rb1$set(as.raw(1), rb1$bytes_data())
  rb1$set(as.raw(2), rb2$bytes_data())
  rb1$reset()
  rb2$reset()

  bytes1 <- random_bytes(2)
  bytes2 <- random_bytes(2)

  expect_equal(rb1$push(bytes1), 2)
  expect_equal(rb2$push(bytes2), 2)

  expect_error(rb2$copy(rb1, 3),
               "Buffer underflow")

  expect_equal(rb1$size(), size)
  expect_equal(rb2$size(), size)
  expect_equal(rb1$free(), rb1$size() - 2)
  expect_equal(rb2$free(), rb2$size() - 2)
  expect_equal(rb1$used(), 2)
  expect_equal(rb2$used(), 2)
  expect_false(rb1$is_full())
  expect_false(rb2$is_full())
  expect_false(rb1$is_empty())
  expect_false(rb2$is_empty())
  expect_equal(rb1$tail_pos(), 0L)
  expect_equal(rb2$tail_pos(), 0L)
  expect_equal(rb1$head_pos(), 2)
  expect_equal(rb2$head_pos(), 2)
})

test_that("ring_buffer_copy, different capacities, overflow 2nd", {
  ## up to end of src, then up to end of dst, then copy remaining bytes.
  size <- 4096L
  rb1 <- ring_buffer_bytes(size)
  rb2 <- ring_buffer_bytes(8)

  rb1$set(as.raw(1), rb1$bytes_data())
  rb1$set(as.raw(2), rb2$bytes_data())
  rb1$reset()
  rb2$reset()

  bytes1 <- random_bytes(10)

  expect_equal(rb1$push(bytes1), 10)

  expect_equal(rb1$copy(rb2, 10), 1)

  expect_equal(rb1$size(), size)
  expect_equal(rb2$size(), 8)
  expect_equal(rb1$free(), rb1$size())
  expect_equal(rb2$free(), 0)
  expect_equal(rb1$used(), 0)
  expect_equal(rb2$used(), 8)
  expect_false(rb1$is_full())
  expect_true(rb2$is_full())
  expect_true(rb1$is_empty())
  expect_false(rb2$is_empty())

  expect_equal(rb1$tail_pos(), 10)
  expect_equal(rb2$tail_pos(), 2)
  expect_equal(rb1$head_pos(), 10)
  expect_equal(rb2$head_pos(), 1)

  expect_equal(rb2$read(8),
               tail(bytes1, 8))
})
