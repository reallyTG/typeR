library(hipread)

context("Read frequencies")

NVARS <- 8
HNUM_FREQ_SORTED <- c("003" = 2, "002" = 3, "001" = 4)
PERMIX_FREQ_SORTED <- c("x" = 1, "d" = 2, "1" = 3)

test_that("Can read a basic frequency example", {
  actual <- hipread_freqs(
    hipread_example("test-basic.dat"),
    list(
      H = hip_fwf_positions(
        start = c(1, 2, 5, 8, 11),
        end = c(1, 4, 7, 10, 12),
        col_names = c("rt", "hhnum", "hh_char", "hh_dbl", "hh_impdbl"),
        col_types = "character"
      ),
      P = hip_fwf_positions(
        start = c(1, 2, 5, 6, 9),
        end = c(1, 4, 5, 8, 9),
        col_names = c("rt", "hhnum", "pernum", "per_dbl", "per_mix"),
        col_types = "character"
      )
    ),
    hip_rt(1, 1)
  )

  expect_equal(length(actual), NVARS)
  expect_equal(sort(actual$hhnum), HNUM_FREQ_SORTED)
  expect_equal(sort(actual$per_mix), PERMIX_FREQ_SORTED)
})
