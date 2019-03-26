library(hipread)

context("Read chunk long")

FILTERED_NROW <- 6
NCOL <- 8
FILTERED_HNUM <- c("001", "001", "001", "001", "003", "003")

test_that("Can read a basic example", {
  skip_if_not_installed("dplyr") # HipDataFrameCallback requires dplyr
  actual <- hipread_long_chunked(
    hipread_example("test-basic.dat"),
    HipDataFrameCallback$new(function(x, pos) x[x$hhnum != "002", ]),
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

  expect_equal(nrow(actual), FILTERED_NROW)
  expect_equal(ncol(actual), NCOL)
  expect_equal(actual$hhnum, FILTERED_HNUM)
})

test_that("Can read a basic gzipped example", {
  skip_if_not_installed("dplyr") # HipDataFrameCallback requires dplyr
  actual <- hipread_long_chunked(
    hipread_example("test-basic.dat.gz"),
    HipDataFrameCallback$new(function(x, pos) x[x$hhnum != "002", ]),
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
  expect_equal(nrow(actual), FILTERED_NROW)
  expect_equal(ncol(actual), NCOL)
  expect_equal(actual$hhnum, FILTERED_HNUM)
})

test_that("Can skip in a basic example", {
  skip_if_not_installed("dplyr") # HipDataFrameCallback requires dplyr
  actual <- hipread_long_chunked(
    hipread_example("test-basic.dat"),
    HipDataFrameCallback$new(function(x, pos) x[x$hhnum != "002", ]),
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

  expect_equal(nrow(actual), FILTERED_NROW - 1)
  expect_equal(ncol(actual), NCOL)
  expect_equal(actual$hhnum, FILTERED_HNUM[-1])
})


NROW <- 9
NCOL <- 3
VAR1 <- c("H", "P", "P", "P", "H", "P", "P", "H", "P")
test_that("Can read a rectangular chunked example", {
  skip_if_not_installed("dplyr") # HipDataFrameCallback requires dplyr
  actual <- hipread_long_chunked(
    hipread_example("test-basic.dat"),
    HipDataFrameCallback$new(function(x, pos) x),
    4,
    hip_fwf_widths(
      c(1, 2, 1),
      c("var1", "var2", "var3"),
      c("character", "character", "character")
    ),
    hip_rt(1, 0)
  )

  expect_equal(nrow(actual), NROW)
  expect_equal(ncol(actual), NCOL)
  expect_equal(actual$var1, VAR1)
})


test_that("Chunks are the correct size", {
  actual <- hipread_long_chunked(
    hipread_example("test-basic.dat"),
    HipListCallback$new(function(x, pos) nrow(x)),
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

  expect_equal(unlist(actual), c(4, 4, 1))
})

test_that("pos is correct", {
  actual <- hipread_long_chunked(
    hipread_example("test-basic.dat"),
    HipListCallback$new(function(x, pos) pos),
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

  expect_equal(unlist(actual), c(1, 5, 9))
})
