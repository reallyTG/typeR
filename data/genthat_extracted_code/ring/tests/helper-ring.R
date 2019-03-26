random_bytes <- function(n) {
  as.raw(sample(2^8, n, TRUE) - 1L)
}

pad <- function(x, len, with = 0) {
  c(x, rep_len(as.raw(with), len - length(x)))
}

repr <- function(x, ...) {
  as.raw(rep(x, ...))
}

fill_buffer <- function(x, len) {
  if (is.character(x)) {
    x <- charToRaw(x)
  } else {
    x <- as.raw(x)
  }
  rep(x, length.out = len)
}

## The length of test_pattern should not fit naturally into size, or
## else it won't be possible to detect proper wrapping of the head
## pointer.
test_pattern <- function(size) {
  fill_buffer((size + 1) * 2, "abcdefghijk")
}

first <- function(x) {
  head(x, 1L)
}

last <- function(x) {
  tail(x, 1L)
}

SEARCH_TYPES <- c("linear", "bisect")
test_search_linear <- function(buffer, value, i) {
  .Call(Ctest_search_linear, buffer, as.double(value))
}
test_search_bisect <- function(buffer, value, i = 0L) {
  .Call(Ctest_search_bisect, buffer, as.double(value), as.integer(i))
}
test_search <- function(buffer, value, type, i = 0L) {
  search <- switch(type,
                   linear = test_search_linear,
                   bisect = test_search_bisect,
                   stop("Invalid search type"))
  search(buffer, value, i)
}

test_advance_head <- function(b, v) {
  .Call(Ctest_advance_head, b$.ptr, v)
}

viapply <- function(X, FUN, ...) {
  vapply(X, FUN, integer(1), ...)
}

pool <- function(type, n) {
  pool <- switch(type,
                 logical = c(TRUE, FALSE, NA),
                 integer = as.integer(1:50),
                 double = rnorm(50),
                 complex = complex(real = rnorm(20), imaginary = rnorm(20)))
  sample(pool, n, TRUE)
}

## I am continuing to have horrid problems with system.file when
## working under devtools, or which versions are broken.  This
## workaround is ported from dde.
PATH_RING <- system.file(package = "ring")
if (!nzchar(PATH_RING)) {
  PATH_RING <- "../../inst"
}

load_ring_vector <- function(env = parent.frame()) {
  sys.source(file.path(PATH_RING, "examples", "ring_vector.R"), env)
}
load_ring_matrix <- function(env = parent.frame()) {
  sys.source(file.path(PATH_RING, "examples", "ring_vector.R"), env)
  sys.source(file.path(PATH_RING, "examples", "ring_matrix.R"), env)
}
