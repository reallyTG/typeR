library(hipread)

context("Read long")

NROW <- 9
NCOL <- 8
HNUM <- c("001", "001", "001", "001", "002", "002", "002", "003", "003")
PERMIX <- c(NA, "x", "1", "1", NA, "d", "1", NA, "d")
HIMPDEC <- c(1, NA, NA, NA, 4.5, NA, NA, 2.4, NA)

test_that("Can read a basic example", {
  actual <- hipread_long(
    hipread_example("test-basic.dat"),
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

  expect_equal(nrow(actual), NROW)
  expect_equal(ncol(actual), NCOL)
  expect_equal(actual$hhnum, HNUM)
  expect_equal(actual$per_mix, PERMIX)
  expect_equal(actual$hh_impdbl, HIMPDEC)
})

test_that("Can read a basic gzipped example", {
  actual <- hipread_long(
    hipread_example("test-basic.dat.gz"),
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
  expect_equal(nrow(actual), NROW)
  expect_equal(ncol(actual), NCOL)
  expect_equal(actual$hhnum, HNUM)
  expect_equal(actual$per_mix, PERMIX)
  expect_equal(actual$hh_impdbl, HIMPDEC)
})

test_that("Can skip in a basic example", {
  actual <- hipread_long(
    hipread_example("test-basic.dat"),
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
    skip = 2
  )

  expect_equal(nrow(actual), NROW - 2)
  expect_equal(ncol(actual), NCOL)
  expect_equal(actual$hhnum, HNUM[-(1:2)])
  expect_equal(actual$per_mix, PERMIX[-(1:2)])
  expect_equal(actual$hh_impdbl, HIMPDEC[-(1:2)])
})

test_that("Can n_max in a basic example", {
  actual <- hipread_long(
    hipread_example("test-basic.dat"),
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
    n_max = 4
  )

  expect_equal(nrow(actual), 4)
  expect_equal(ncol(actual), NCOL)
  expect_equal(actual$hhnum, HNUM[1:4])
  expect_equal(actual$per_mix, PERMIX[1:4])
  expect_equal(actual$hh_impdbl, HIMPDEC[1:4])
})

NROW <- 9
NCOL <- 3
VAR1 <- c("H", "P", "P", "P", "H", "P", "P", "H", "P")
test_that("Can read a rectangular example", {
  actual <- hipread_long(
    hipread_example("test-basic.dat"),
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


NROW <- 300000
TEXT <- c("abc123xyz", "def456uvw", "ghi789rst", "jkl000opq")
NCOL <- 3
VAR1 <- rep(strtrim(TEXT, 3), NROW)

test_that("Can read a large gzipped example", {
  full_data <- rep(TEXT, NROW)
  temp_file <- tempfile(fileext = ".dat.gz")
  temp_conn <- gzfile(temp_file)

  writeLines(full_data, temp_conn)

  close(temp_conn)
  rm(full_data)

  actual <- hipread_long(
    temp_file,
    hip_fwf_widths(
      c(3, 3, 3),
      c("var1", "var2", "var3"),
      c("character", "integer", "character")
    )
  )

  expect_equal(nrow(actual), NROW * length(TEXT))
  expect_equal(ncol(actual), NCOL)
  expect_equal(actual$var1, VAR1)
})

test_that("reading from fwf_positions correctly uses defaults", {
  expect_equal(
    hipread_long(
      hipread_example("test-whitespace.dat"),
      hip_fwf_widths(
        c(3, 1),
        c("var1", "var2"),
        c("c", "d")
      )
    ),
    hipread_long(
      hipread_example("test-whitespace.dat"),
      hip_fwf_widths(
        c(3, 1),
        c("var1", "var2"),
        c("c", "d"),
        trim_ws = c(TRUE, NA),
        imp_dec = c(100, 0)
      )
    )
  )
})

test_that("Unknown rectypes produce expected warnings", {
  expect_warning(
    hipread_long(
      hipread_example("test-basic.dat"),
      list(
        H = hip_fwf_widths(
          c(1, 3, 3, 3, 2),
          c("rt", "hhnum", "hh_char", "hh_dbl", "hh_impdbl"),
          c("character", "character", "character", "double", "double"),
          trim_ws = c(TRUE, FALSE, TRUE, NA, NA),
          imp_dec = c(NA, NA, NA, 0, 1)
        )
      ),
      hip_rt(1, 1)
    ),
    "unknown record type"
  )

  expect_silent(
    ignore <- hipread_long(
      hipread_example("test-basic.dat"),
      list(
        H = hip_fwf_widths(
          c(1, 3, 3, 3, 2),
          c("rt", "hhnum", "hh_char", "hh_dbl", "hh_impdbl"),
          c("character", "character", "character", "double", "double"),
          trim_ws = c(TRUE, FALSE, TRUE, NA, NA),
          imp_dec = c(NA, NA, NA, 0, 1)
        )
      ),
      hip_rt(1, 1, FALSE)
    )
  )
})
