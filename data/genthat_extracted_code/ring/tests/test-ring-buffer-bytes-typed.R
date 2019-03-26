context("ring_buffer_bytes_typed (typed)")

test_that("conversion functions are transitive", {
  vec <- list(
    logical = c(TRUE, FALSE, NA),
    integer = c(NA, as.integer(sample(10))),
    double = c(NA, NaN, runif(10)),
    complex = c(NA, NaN, complex(real = runif(10), imaginary = runif(10))))
  expect_equal(sort(names(vec)), sort(names(sizes)))

  for (nm in names(vec)) {
    x_r <- vec[[nm]]
    x_b <- convert_to[[nm]](x_r)
    expect_is(x_b, "raw")
    expect_equal(length(x_b), sizes[[nm]] * length(x_r))
    expect_identical(convert_from[[nm]](x_b), x_r)
  }
})

test_that("basic", {
  for (type in names(sizes)) {
    size <- 100
    n <- 7
    buf <- ring_buffer_bytes_typed(size, create[[type]](n))

    expect_is(buf, "ring_buffer_bytes_translate")
    expect_equal(buf$.type, paste0("typed:", type))

    expect_equal(buf$size(), size)
    expect_equal(buf$stride(), sizes[[type]] * n)

    x1 <- pool(type, n)

    buf$push(x1)
    expect_equal(buf$used(), 1)
    expect_equal(buf$used(TRUE), n * sizes[[type]])

    expect_identical(buf$tail(), x1)
    expect_identical(buf$tail_offset(0), x1)

    expect_equal(buf$head_pos(), 1)
    expect_equal(buf$head_pos(TRUE), sizes[[type]] * n)
    expect_equal(buf$head_offset(0), buf$head())

    x2 <- matrix(pool(type, n * 3), 3, byrow = FALSE)
    buf$push(x2)

    expect_identical(buf$read(4), c(x1, x2))

    p <- buf$head_pos(TRUE)

    x3 <- pool(type, 2)
    expect_error(buf$push(x3), "Incorrect size data")
    expect_identical(buf$head_pos(TRUE), p)

    expect_equal(buf$head_offset(3), buf$tail())
    expect_equal(buf$tail_offset(3), buf$head())
  }
})

test_that("initialisation", {
  b <- ring_buffer_bytes_typed(5, numeric(), 4L)
  expect_equal(b$size(), 5L)
  expect_equal(b$stride(), sizes[["double"]] * 4L)
  expect_equal(b$.type, "typed:double")

  b <- ring_buffer_bytes_typed(5, "numeric", 4L)
  expect_equal(b$size(), 5L)
  expect_equal(b$stride(), sizes[["double"]] * 4L)
  expect_equal(b$.type, "typed:double")

  expect_error(ring_buffer_bytes_typed(5, numeric()),
               "'len' must be greater than zero")
  expect_error(ring_buffer_bytes_typed(5, "double"),
               "'len' must be greater than zero")
  expect_error(ring_buffer_bytes_typed(5, 2, 5),
               "Invalid value for 'what'")
  expect_error(ring_buffer_bytes_typed(5, 2, "double"),
               "Invalid value for 'what'")

  expect_error(ring_buffer_bytes_typed(5, "numbers", 10),
               "'what' must be one of")
  expect_error(ring_buffer_bytes_typed(5, "character", 10),
               "'what' must be one of")
  expect_error(ring_buffer_bytes_typed(5, character(10)),
               "storage.mode(what) must be one of", fixed = TRUE)
})

test_that("translate", {
  b <- ring_buffer_bytes_translate(5, 8L, charToRaw, rawToChar)
  b$push("12345678")
  expect_equal(b$used(), 1L)
  expect_equal(b$tail(), "12345678")
})

test_that("format", {
  b <- ring_buffer_bytes_typed(10, numeric(4))
  txt <- strsplit(format(b), "\n")[[1]]
  expect_match(txt[[1]], "typed:double")
})

test_that("set", {
  b <- ring_buffer_bytes_typed(10, integer(4))
  r <- pool("integer", 4)
  b$set(r, b$size())
  expect_equal(b$head(), r)
  expect_equal(b$tail(), r)
  expect_true(b$is_full())
  expect_equal(b$take(4), rep(r, 4))
})

test_that("head_set", {
  b <- ring_buffer_bytes_typed(10, integer(4))
  r <- pool("integer", 4)
  b$head_set(r)
  expect_true(b$is_empty())
  expect_equal(b$head_data(), r)
  b$head_advance()
  expect_equal(b$tail(), r)
  ## NOTE: these are pretty rubbish error messages
  expect_error(b$head_set(pool("integer", 5)),
               "Incorrect size data")
  expect_error(b$head_set(pool("integer", 3)),
               "Incorrect size data")
})

test_that("take_head, read_head", {
  b <- ring_buffer_bytes_typed(10, integer(4))
  r <- matrix(pool("integer", 4 * 3), 4)
  b$push(r)
  expect_equal(b$read_head(1), r[, 3])
  expect_equal(b$take_head(1), r[, 3])
  expect_equal(b$used(), 2)

  expect_equal(b$read_head(2), c(r[, 2:1]))
  expect_equal(b$take_head(2), c(r[, 2:1]))
  expect_equal(b$used(), 0)

  expect_error(b$read_head(2), "underflow")
  expect_error(b$take_head(2), "underflow")
})

test_that("duplicate", {
  b1 <- ring_buffer_bytes_typed(10, integer(4))
  r <- matrix(pool("integer", 4 * 3), 4)
  b1$push(r)
  b2 <- b1$duplicate()
  expect_is(b2, class(b1))
  expect_false(identical(b1$.ptr, b2$ptr))

  expect_equal(b2$head_pos(), b1$head_pos())
  expect_equal(b2$tail_pos(), b1$tail_pos())
  expect_equal(b2$used(), b1$used())
  expect_equal(b2$size(), b1$size())
  expect_equal(b2$read(b2$used()), b1$read(b1$used()))

  x <- b2$take(1)
  expect_equal(x, r[, 1])

  ## Uncoupled:
  expect_equal(b2$used(), 2)
  expect_equal(b1$used(), 3)
})
