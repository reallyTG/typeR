library(hipread)

context("Read chunk list")

FILTERED_NROW <- c(H = 2, P = 4)
NCOL <- c(H = 5, P = 5)
FILTERED_HNUM <- list(H = c("001", "003"), P = c("001", "001", "001", "003"))

test_that("Can read a basic example", {
  actual <- hipread_list_chunked(
    hipread_example("test-basic.dat"),
    HipListCallback$new(function(x, pos) {
      out <-lapply(x, function(y) y[y$hhnum != "002", ])
      names(out) <- names(x)
      out
    }),
    4,
    list(
      H = hip_fwf_widths(
        c(1, 3, 3, 3, 2),
        c("rt", "hhnum", "hh_char", "hh_dbl", "hh_impdbl"),
        c("character", "character", "character", "double", "double"),
        trim_ws = c(TRUE, FALSE, TRUE, NA, NA),
        imp_dec = c(NA, NA, NA, 0, 1)
      ),
      P = hip_fwf_widths(
        c(1, 3, 1, 3, 1),
        c("rt", "hhnum", "pernum", "per_dbl", "per_mix"),
        c("character", "character", "integer", "double", "character"),
        trim_ws = c(TRUE, FALSE, NA, NA, TRUE),
        imp_dec = c(NA, NA, NA, 0, NA)
      )
    ),
    hip_rt(1, 1)
  )
  actual_rt <- names(actual[[1]])
  actual <- lapply(actual_rt, function(x) do.call(rbind, lapply(actual, function(y) y[[x]])))
  names(actual) <- actual_rt

  expect_equal(vapply(actual, nrow, numeric(1)), FILTERED_NROW)
  expect_equal(vapply(actual, ncol, numeric(1)), NCOL)
  expect_equal(lapply(actual, function(x) x$hhnum), FILTERED_HNUM)
})

test_that("Can read a basic gzipped example", {
  actual <- hipread_list_chunked(
    hipread_example("test-basic.dat.gz"),
    HipListCallback$new(function(x, pos) {
      out <-lapply(x, function(y) y[y$hhnum != "002", ])
      names(out) <- names(x)
      out
    }),
    4,
    list(
      H = hip_fwf_widths(
        c(1, 3, 3, 3, 2),
        c("rt", "hhnum", "hh_char", "hh_dbl", "hh_impdbl"),
        c("character", "character", "character", "double", "double"),
        trim_ws = c(TRUE, FALSE, TRUE, NA, NA),
        imp_dec = c(NA, NA, NA, 0, 1)
      ),
      P = hip_fwf_widths(
        c(1, 3, 1, 3, 1),
        c("rt", "hhnum", "pernum", "per_dbl", "per_mix"),
        c("character", "character", "integer", "double", "character"),
        trim_ws = c(TRUE, FALSE, NA, NA, TRUE),
        imp_dec = c(NA, NA, NA, 0, NA)
      )
    ),
    hip_rt(1, 1)
  )
  actual_rt <- names(actual[[1]])
  actual <- lapply(actual_rt, function(x) do.call(rbind, lapply(actual, function(y) y[[x]])))
  names(actual) <- actual_rt

  expect_equal(vapply(actual, nrow, numeric(1)), FILTERED_NROW)
  expect_equal(vapply(actual, ncol, numeric(1)), NCOL)
  expect_equal(lapply(actual, function(x) x$hhnum), FILTERED_HNUM)
})

SKIP_FILTERED_NROW <- c(H = 1, P = 4)
SKIP_FILTERED_HNUM <- list(H = c("003"), P = c("001", "001", "001", "003"))
test_that("Can skip in a basic example", {
  actual <- hipread_list_chunked(
    hipread_example("test-basic.dat"),
    HipListCallback$new(function(x, pos) {
      out <-lapply(x, function(y) y[y$hhnum != "002", ])
      names(out) <- names(x)
      out
    }),
    4,
    list(
      H = hip_fwf_widths(
        c(1, 3, 3, 3, 2),
        c("rt", "hhnum", "hh_char", "hh_dbl", "hh_impdbl"),
        c("character", "character", "character", "double", "double"),
        trim_ws = c(TRUE, FALSE, TRUE, NA, NA),
        imp_dec = c(NA, NA, NA, 0, 1)
      ),
      P = hip_fwf_widths(
        c(1, 3, 1, 3, 1),
        c("rt", "hhnum", "pernum", "per_dbl", "per_mix"),
        c("character", "character", "integer", "double", "character"),
        trim_ws = c(TRUE, FALSE, NA, NA, TRUE),
        imp_dec = c(NA, NA, NA, 0, NA)
      )
    ),
    hip_rt(1, 1),
    skip = 1
  )
  actual_rt <- names(actual[[1]])
  actual <- lapply(actual_rt, function(x) do.call(rbind, lapply(actual, function(y) y[[x]])))
  names(actual) <- actual_rt

  expect_equal(vapply(actual, nrow, numeric(1)), SKIP_FILTERED_NROW)
  expect_equal(vapply(actual, ncol, numeric(1)), NCOL)
  expect_equal(lapply(actual, function(x) x$hhnum), SKIP_FILTERED_HNUM)
})
