context("ring_buffer_env")

test_that("empty", {
  n <- 10
  buf <- ring_buffer_env(10)
  expect_equal(buf$size(), n)
  expect_identical(buf$size(), as.integer(n))

  expect_equal(buf$used(), 0L)
  expect_equal(buf$free(), 10L)
  expect_true(buf$is_empty())
  expect_false(buf$is_full())
  expect_equal(buf$head_pos(), 0L)
  expect_equal(buf$tail_pos(), 0L)
})

test_that("push", {
  n <- 10
  buf <- ring_buffer_env(10)
  m <- 4
  buf$push(1:m)
  expect_equal(buf$used(), m)
  expect_equal(buf$free(), n - m)

  expect_false(buf$is_empty())
  expect_false(buf$is_full())
  expect_equal(buf$head_pos(), m)
  expect_equal(buf$tail_pos(), 0L)

  expect_equal(buf$tail(), 1)
  expect_equal(buf$head(), m)
})

test_that("read", {
  n <- 10
  buf <- ring_buffer_env(10)
  m <- 4
  buf$push(1:m)

  expect_equal(buf$read(0), list())
  expect_equal(buf$read(m), as.list(1:m))
  expect_error(buf$read(m + 1), "Buffer underflow")
})

test_that("tail_offset", {
  n <- 10
  buf <- ring_buffer_env(10)
  m <- 4
  buf$push(1:m)

  expect_equal(buf$tail_offset(0), 1L)
  expect_equal(buf$tail_offset(1), 2L)
  expect_equal(buf$tail_offset(m - 1), m)
  expect_error(buf$tail_offset(m), "Buffer underflow")
})

test_that("head_offset", {
  n <- 10
  buf <- ring_buffer_env(n)
  m <- 4
  buf$push(1:m)

  expect_equal(buf$head_offset(0), m)
  expect_equal(buf$head_offset(1), m - 1)
  expect_equal(buf$head_offset(m - 1), 1)
  expect_error(buf$head_offset(m), "Buffer underflow")
})

test_that("take", {
  n <- 10
  buf <- ring_buffer_env(10)
  m <- 4
  buf$push(1:m)

  expect_equal(buf$take(0), list())
  expect_equal(buf$used(), m)

  expect_equal(buf$take(1), list(1))
  expect_equal(buf$used(), m - 1)

  expect_equal(buf$head_pos(), m)
  expect_equal(buf$tail_pos(), 1L)
  expect_equal(buf$tail(), 2)

  expect_equal(buf$take(m - 1), as.list(2:m))
  expect_equal(buf$head_pos(), m)
  expect_equal(buf$tail_pos(), m)
  expect_true(buf$is_empty())
  expect_false(buf$is_full())
})

test_that("take_head", {
  n <- 10
  buf <- ring_buffer_env(10)
  m <- 4
  buf$push(1:m)

  expect_equal(buf$read_head(0), list())
  expect_equal(buf$take_head(0), list())
  expect_equal(buf$used(), m)

  expect_equal(buf$read_head(1), list(m))
  expect_equal(buf$take_head(1), list(m))
  expect_equal(buf$used(), m - 1)

  expect_equal(buf$head_pos(), m - 1L)
  expect_equal(buf$tail_pos(), 0L)
  expect_equal(buf$tail(), 1)
  expect_equal(buf$head(), m - 1L)

  expect_equal(buf$read_head(m - 1), as.list(rev(seq_len(m - 1))))
  expect_equal(buf$take_head(m - 1), as.list(rev(seq_len(m - 1))))
  expect_equal(buf$head_pos(), 0L)
  expect_equal(buf$tail_pos(), 0L)
  expect_true(buf$is_empty())
  expect_false(buf$is_full())
})

test_that("fill buffer, then overflow", {
  n <- 10
  buf <- ring_buffer_env(10)
  buf$push(1:n)
  expect_true(buf$is_full())
  expect_equal(buf$used(), n)
  expect_identical(buf$.head, buf$.tail)

  expect_equal(buf$head_pos(), 0L) # wrapped...
  expect_equal(buf$tail_pos(), 0L) # hasn't moved yet

  ## All the data is here:
  expect_equal(buf$read(n), as.list(seq_len(n)))

  ## Add one more, causing an overflow:
  buf$push(n + 1)
  expect_true(buf$is_full())
  expect_equal(buf$used(), n)
  expect_identical(buf$.head, buf$.tail)

  expect_equal(buf$head_pos(), 1L)
  expect_equal(buf$tail_pos(), 1L)

  expect_equal(buf$read(n), as.list(seq_len(n) + 1L))
})

test_that("duplicate", {
  n <- 10
  buf <- ring_buffer_env(10)
  buf$push(1:12)
  buf$take(3)

  expect_equal(buf$head_pos(), 2)
  expect_equal(buf$tail_pos(), 5)
  expect_equal(buf$used(), 7)
  expect_equal(buf$size(), n)
  expect_equal(buf$read(buf$used()), as.list(6:12))

  cpy <- buf$duplicate()

  ## Source unchanged:
  for (x in list(buf, cpy)) {
    expect_equal(x$head_pos(), 2)
    expect_equal(x$tail_pos(), 5)
    expect_equal(x$used(), 7)
    expect_equal(x$size(), n)
    expect_equal(x$read(x$used()), as.list(6:12))
  }

  ## But we can move the two buffers independently.
  expect_equal(cpy$take(2), as.list(6:7))
  cpy$push(13)

  expect_equal(buf$head_pos(), 2)
  expect_equal(buf$tail_pos(), 5)
  expect_equal(buf$used(), 7)
  expect_equal(buf$size(), n)
  expect_equal(buf$read(buf$used()), as.list(6:12))

  expect_equal(cpy$head_pos(), 3)
  expect_equal(cpy$tail_pos(), 7)
  expect_equal(cpy$used(), 6)
  expect_equal(cpy$size(), n)
  expect_equal(cpy$read(cpy$used()), as.list(8:13))
})

test_that("copy zero", {
  n1 <- 20
  n2 <- 10
  buf1 <- ring_buffer_env(n1)
  buf2 <- ring_buffer_env(n2)

  buf1$push(1:n1)
  buf1$copy(buf2, 0L)

  expect_equal(buf1$head_pos(), 0)
  expect_equal(buf2$head_pos(), 0)
  expect_equal(buf1$tail_pos(), 0)
  expect_equal(buf2$tail_pos(), 0)
  expect_equal(buf1$used(), n1)
  expect_equal(buf2$used(), 0)
})

test_that("copy some", {
  n1 <- 20
  n2 <- 10
  buf1 <- ring_buffer_env(n1)
  buf2 <- ring_buffer_env(n2)

  buf1$push(1:n1)
  buf1$copy(buf2, 5L)

  expect_equal(buf1$head_pos(), 0)
  expect_equal(buf2$head_pos(), 5)
  expect_equal(buf1$tail_pos(), 5)
  expect_equal(buf2$tail_pos(), 0)
  expect_equal(buf1$used(), n1 - 5)
  expect_equal(buf2$used(), 5)
})

test_that("can't copy into self", {
  n <- 20
  buf <- ring_buffer_env(n)
  expect_error(buf$copy(buf, 0),
               "Can't copy a buffer into itself")
})

## Because we do things that create circular references, I want to
## check that R will delete everything appropriately.
test_that("destruction", {
  buf <- ring_buffer_env(10)
  buf$push(1:10)

  deleted <- integer(0)
  finaliser <- function(obj) {
    deleted <<- c(deleted, obj$data)
  }
  local({
    head <- buf$.head
    for (i in seq_len(buf$size())) {
      reg.finalizer(head, finaliser)
      head <- head$.next
    }
  })
  rm(buf)
  gc()

  expect_equal(length(deleted), 10L)
  expect_equal(sort(deleted), 1:10)
})

test_that("set", {
  buf <- ring_buffer_env(10)
  expect_null(buf$set(1, 10))
  expect_true(buf$is_full())
  expect_equal(buf$read(10), rep(list(1), 10))
})

test_that("no overflow", {
  buf <- ring_buffer_env(10, "error")
  expect_error(buf$push(1:11), "Buffer overflow")
  expect_equal(buf$used(), 0)
  expect_true(buf$.check_overflow)
  expect_true(buf$.prevent_overflow)

  buf$push(1:5)
  expect_error(buf$push(6:11), "Buffer overflow")
  expect_equal(buf$used(), 5)
  expect_equal(buf$size(), 10)
  expect_equal(as.list(buf), as.list(1:5))

  buf2 <- buf$duplicate()
  expect_true(buf2$.check_overflow)
  expect_true(buf2$.prevent_overflow)
  expect_error(buf2$push(6:11), "Buffer overflow")
  expect_equal(buf2$used(), 5)
  expect_equal(as.list(buf2), as.list(1:5))
})

test_that("grow", {
  ## First, try manually growing a buffer under various states.  This
  ## has slightly fewer moving parts than doing this reactively based
  ## on overflow.
  ##
  ## There are three scenarios to try here: empty, partially full and
  ## totally full.
  n <- 4
  e <- 3

  ## (1) empty
  buf <- ring_buffer_env(n)
  expect_null(buf$grow(e))
  expect_equal(buf$size(), n + e)
  expect_equal(buf$used(), 0)
  buf$push(seq_len(n + e))
  expect_equal(buf$read(n + e), as.list(seq_len(n + e)))

  ## (2) partially full
  buf <- ring_buffer_env(n)
  buf$push(1:2)
  buf$grow(e)
  expect_equal(buf$size(), n + e)
  expect_equal(buf$used(), 2)
  buf$push(e:(n + e))
  expect_equal(buf$read(n + e), as.list(seq_len(n + e)))

  ## (e) completely full
  buf <- ring_buffer_env(n)
  buf$push(1:n)
  buf$grow(e)
  expect_equal(buf$size(), n + e)
  expect_equal(buf$used(), n)
  buf$push(seq_len(e) + n)
  expect_equal(buf$read(n + e), as.list(seq_len(n + e)))
})

test_that("zero growth", {
  n <- 10
  buf <- ring_buffer_env(n)
  b <- random_bytes(n)
  buf$push(b)
  buf$grow(0)
  expect_equal(buf$size(), n)
  expect_equal(buf$read(n), as.list(b))
  expect_equal(buf$head_pos(), 0)
  expect_equal(buf$tail_pos(), 0)
})

test_that("grow on overflow", {
  buf <- ring_buffer_env(4, "grow")

  buf$push(1:10)
  expect_equal(buf$size(), 10)
  expect_true(buf$is_full())
  expect_equal(buf$read(10), as.list(1:10))

  expect_equal(buf$take(2), as.list(1:2))

  buf$push(11:15)
  expect_equal(buf$size(), 13)
  expect_equal(buf$read(13), as.list(3:15))

  buf$push(16:20)
  expect_equal(buf$size(), 18)
  expect_equal(buf$read(18), as.list(3:20))
})

test_that("invalid overflow option", {
  expect_error(ring_buffer_env(10, "g"),
               "Invalid value for 'on_overflow'")
  expect_error(ring_buffer_env(10, NA),
               "Invalid value for 'on_overflow'")
  expect_error(ring_buffer_env(10, "magic"),
               "Invalid value for 'on_overflow'")

  expect_error(ring_buffer_env(10, 1),
               "on_overflow must be a character")
  expect_error(ring_buffer_env(10, character(0)),
               "on_overflow must be a scalar")
})

test_that("format", {
  b <- ring_buffer_env(10)
  expect_false(any(grepl("\\.[a-z]+:", strsplit(format(b), "\n")[[1]])))
  class(b) <- c("tmp", "R6")
  expect_true(any(grepl("\\.[a-z]+:", strsplit(format(b), "\n")[[1]])))
})

test_that("mirror", {
  size <- 50

  rb1 <- ring_buffer_env(size)
  rb2 <- ring_buffer_env(size)

  bb1 <- random_bytes(floor(size / 2))
  bb2 <- random_bytes(floor(size / 3))
  rb1$push(bb1)
  rb2$push(bb2)

  expect_error(rb1$mirror(rb1),
               "Can't mirror a buffer into itself")
  expect_error(rb1$mirror(ring_buffer_bytes(size - 1)),
               "Can't mirror as buffers differ in their size (50 vs 49)",
               fixed = TRUE)

  expect_equal(rb1$read(rb1$used()), as.list(bb1))
  expect_equal(rb2$read(rb2$used()), as.list(bb2))

  rb1$mirror(rb2)
  expect_equal(rb1$read(rb1$used()), as.list(bb1))
  expect_equal(rb1$read(rb1$used()), as.list(bb1))
  expect_equal(rb1$head_pos(), rb2$head_pos())
  expect_equal(rb1$tail_pos(), rb2$tail_pos())
  expect_equal(rb1$used(), rb2$used())

  ## Now rotate the buffer and try again:
  rb2$push(seq_len(size + 5))
  rb2$take(4)
  bb3 <- rb2$read(rb2$used())

  rb2$mirror(rb1)
  expect_equal(rb1$read(rb1$used()), as.list(bb3))
  expect_equal(rb2$read(rb2$used()), as.list(bb3))
  expect_equal(rb1$head_pos(), rb2$head_pos())
  expect_equal(rb1$tail_pos(), rb2$tail_pos())
  expect_equal(rb1$used(), rb2$used())
})

test_that("reset", {
  rb <- ring_buffer_env(10)
  rb$push(1:3)
  rb$push(seq_len(rb$size()))

  rb$reset()
  expect_equal(rb$used(), 0)
  expect_true(rb$is_empty())
  expect_equal(rb$head_pos(), 0)
  expect_equal(rb$tail_pos(), 0)

  expect_equal(rb$.buffer$data, 8L)
  rb$reset(TRUE)
  expect_null(rb$.buffer$data)
})

test_that("typed errors", {
  b <- ring_buffer_env(10, on_overflow = "error")
  expect_error(b$push(1:20), "Buffer overflow")
  ans <- tryCatch(b$push(1:20), error = function(e) e)
  expect_is(ans, "ring_overflow")
  expect_equal(ans$free, 10)
  expect_equal(ans$requested, 20)
  expect_equal(tryCatch(b$push(1:20), ring_overflow = function(e) e), ans)

  expect_error(b$read(1), "Buffer underflow")
  ans <- tryCatch(b$read(1), error = function(e) e)
  expect_is(ans, "ring_underflow")
  expect_equal(ans$used, 0)
  expect_equal(ans$requested, 1)
  expect_equal(tryCatch(b$read(1), ring_underflow = function(e) e), ans)
})

test_that("head set/get/advance", {
  rb <- ring_buffer_env(10)
  d <- runif(1)
  rb$head_set(d)
  expect_equal(rb$head_data(), d)
  expect_true(rb$is_empty())

  rb$head_advance()
  expect_false(rb$is_empty())
  expect_equal(rb$used(), 1)
  expect_equal(rb$tail(), d)
})

test_that("store arbitrary objects", {
  rb <- ring_buffer_env(10)
  fit <- lm(mpg ~ cyl, mtcars)
  rb$push(fit, iterate = FALSE)
  ans <- rb$take(1)
  expect_equal(ans[[1]], fit)
})
