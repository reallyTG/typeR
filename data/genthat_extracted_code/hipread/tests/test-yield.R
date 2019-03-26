library(hipread)

context("Yields - long")

test_that("reading full data is equivalent to yields (.dat)", {
  full <- hipread_long(
    hipread_example("test-basic.dat"),
    list(
      H = hip_fwf_positions(
        c(1, 2, 5, 8),
        c(1, 4, 7, 10),
        c("rt", "hhnum", "hh_char", "hh_dbl"),
        c("c", "i", "c", "d")
      ),
      P = hip_fwf_widths(
        c(1, 3, 1, 3, 1),
        c("rt", "hhnum",  "pernum", "per_dbl", "per_mix"),
        c("c", "i", "i", "d", "c")
      )
    ),
    hip_rt(1, 1)
  )

  yield <- hipread_long_yield(
    hipread_example("test-basic.dat"),
    list(
      H = hip_fwf_positions(
        c(1, 2, 5, 8),
        c(1, 4, 7, 10),
        c("rt", "hhnum", "hh_char", "hh_dbl"),
        c("c", "i", "c", "d")
      ),
      P = hip_fwf_widths(
        c(1, 3, 1, 3, 1),
        c("rt", "hhnum",  "pernum", "per_dbl", "per_mix"),
        c("c", "i", "i", "d", "c")
      )
    ),
    hip_rt(1, 1)
  )

  yield_data <- list()
  while (!yield$is_done()) {
    yield_data[[length(yield_data) + 1]] <-  yield$yield(4)
  }
  yield_data <- do.call(rbind, yield_data)
  expect_equal(full, yield_data)
})

test_that("reading full data is equivalent to yields (.dat.gz)", {
  full <- hipread_long(
    hipread_example("test-basic.dat.gz"),
    list(
      H = hip_fwf_positions(
        c(1, 2, 5, 8),
        c(1, 4, 7, 10),
        c("rt", "hhnum", "hh_char", "hh_dbl"),
        c("c", "i", "c", "d")
      ),
      P = hip_fwf_widths(
        c(1, 3, 1, 3, 1),
        c("rt", "hhnum",  "pernum", "per_dbl", "per_mix"),
        c("c", "i", "i", "d", "c")
      )
    ),
    hip_rt(1, 1)
  )

  yield <- hipread_long_yield(
    hipread_example("test-basic.dat.gz"),
    list(
      H = hip_fwf_positions(
        c(1, 2, 5, 8),
        c(1, 4, 7, 10),
        c("rt", "hhnum", "hh_char", "hh_dbl"),
        c("c", "i", "c", "d")
      ),
      P = hip_fwf_widths(
        c(1, 3, 1, 3, 1),
        c("rt", "hhnum",  "pernum", "per_dbl", "per_mix"),
        c("c", "i", "i", "d", "c")
      )
    ),
    hip_rt(1, 1)
  )

  yield_data <- list()
  while (!yield$is_done()) {
    yield_data[[length(yield_data) + 1]] <-  yield$yield(4)
  }
  yield_data <- do.call(rbind, yield_data)
  expect_equal(full, yield_data)
})

test_that("first yield equals first yield after reset (.dat)", {
  yield <- hipread_long_yield(
    hipread_example("test-basic.dat"),
    list(
      H = hip_fwf_positions(
        c(1, 2, 5, 8),
        c(1, 4, 7, 10),
        c("rt", "hhnum", "hh_char", "hh_dbl"),
        c("c", "i", "c", "d")
      ),
      P = hip_fwf_widths(
        c(1, 3, 1, 3, 1),
        c("rt", "hhnum",  "pernum", "per_dbl", "per_mix"),
        c("c", "i", "i", "d", "c")
      )
    ),
    hip_rt(1, 1)
  )

  first_yield <- yield$yield(4)
  ignore <- yield$yield(2)
  yield$reset()

  expect_equal(yield$yield(4), first_yield)
})

test_that("first yield equals first yield after reset (.dat.gz)", {
  yield <- hipread_long_yield(
    hipread_example("test-basic.dat.gz"),
    list(
      H = hip_fwf_positions(
        c(1, 2, 5, 8),
        c(1, 4, 7, 10),
        c("rt", "hhnum", "hh_char", "hh_dbl"),
        c("c", "i", "c", "d")
      ),
      P = hip_fwf_widths(
        c(1, 3, 1, 3, 1),
        c("rt", "hhnum",  "pernum", "per_dbl", "per_mix"),
        c("c", "i", "i", "d", "c")
      )
    ),
    hip_rt(1, 1)
  )

  first_yield <- yield$yield(4)
  ignore <- yield$yield(2)
  yield$reset()

  expect_equal(yield$yield(4), first_yield)
})

test_that("cur_pos is updated correctly", {
  yield <- hipread_long_yield(
    hipread_example("test-basic.dat"),
    list(
      H = hip_fwf_positions(
        c(1, 2, 5, 8),
        c(1, 4, 7, 10),
        c("rt", "hhnum", "hh_char", "hh_dbl"),
        c("c", "i", "c", "d")
      ),
      P = hip_fwf_widths(
        c(1, 3, 1, 3, 1),
        c("rt", "hhnum",  "pernum", "per_dbl", "per_mix"),
        c("c", "i", "i", "d", "c")
      )
    ),
    hip_rt(1, 1)
  )

  expect_equal(yield$cur_pos, 1)
  first_yield <- yield$yield(4)
  expect_equal(yield$cur_pos, 5)
  next_yield <- yield$yield(2)
  expect_equal(yield$cur_pos, 7)
  yield$reset()
  final_yield <- yield$yield(3)
  expect_equal(yield$cur_pos, 4)
})


context("Yields - list")

test_that("reading full data is equivalent to yields (.dat)", {
  full <- hipread_list(
    hipread_example("test-basic.dat"),
    list(
      H = hip_fwf_positions(
        c(1, 2, 5, 8),
        c(1, 4, 7, 10),
        c("rt", "hhnum", "hh_char", "hh_dbl"),
        c("c", "i", "c", "d")
      ),
      P = hip_fwf_widths(
        c(1, 3, 1, 3, 1),
        c("rt", "hhnum",  "pernum", "per_dbl", "per_mix"),
        c("c", "i", "i", "d", "c")
      )
    ),
    hip_rt(1, 1)
  )

  yield <- hipread_list_yield(
    hipread_example("test-basic.dat"),
    list(
      H = hip_fwf_positions(
        c(1, 2, 5, 8),
        c(1, 4, 7, 10),
        c("rt", "hhnum", "hh_char", "hh_dbl"),
        c("c", "i", "c", "d")
      ),
      P = hip_fwf_widths(
        c(1, 3, 1, 3, 1),
        c("rt", "hhnum",  "pernum", "per_dbl", "per_mix"),
        c("c", "i", "i", "d", "c")
      )
    ),
    hip_rt(1, 1)
  )

  yield_data <- list()
  while (!yield$is_done()) {
    yield_data[[length(yield_data) + 1]] <- yield$yield(4)
  }

  yield_h_data <- do.call(rbind, lapply(yield_data, function(x) x$H))
  yield_p_data <- do.call(rbind, lapply(yield_data, function(x) x$P))

  expect_equal(full$H, yield_h_data)
  expect_equal(full$P, yield_p_data)
})

test_that("reading full data is equivalent to yields (.dat.gz)", {
  full <- hipread_list(
    hipread_example("test-basic.dat.gz"),
    list(
      H = hip_fwf_positions(
        c(1, 2, 5, 8),
        c(1, 4, 7, 10),
        c("rt", "hhnum", "hh_char", "hh_dbl"),
        c("c", "i", "c", "d")
      ),
      P = hip_fwf_widths(
        c(1, 3, 1, 3, 1),
        c("rt", "hhnum",  "pernum", "per_dbl", "per_mix"),
        c("c", "i", "i", "d", "c")
      )
    ),
    hip_rt(1, 1)
  )

  yield <- hipread_list_yield(
    hipread_example("test-basic.dat.gz"),
    list(
      H = hip_fwf_positions(
        c(1, 2, 5, 8),
        c(1, 4, 7, 10),
        c("rt", "hhnum", "hh_char", "hh_dbl"),
        c("c", "i", "c", "d")
      ),
      P = hip_fwf_widths(
        c(1, 3, 1, 3, 1),
        c("rt", "hhnum",  "pernum", "per_dbl", "per_mix"),
        c("c", "i", "i", "d", "c")
      )
    ),
    hip_rt(1, 1)
  )

  yield_data <- list()
  while (!yield$is_done()) {
    yield_data[[length(yield_data) + 1]] <- yield$yield(4)
  }

  yield_h_data <- do.call(rbind, lapply(yield_data, function(x) x$H))
  yield_p_data <- do.call(rbind, lapply(yield_data, function(x) x$P))

  expect_equal(full$H, yield_h_data)
  expect_equal(full$P, yield_p_data)
})

test_that("first yield equals first yield after reset (.dat)", {
  yield <- hipread_list_yield(
    hipread_example("test-basic.dat"),
    list(
      H = hip_fwf_positions(
        c(1, 2, 5, 8),
        c(1, 4, 7, 10),
        c("rt", "hhnum", "hh_char", "hh_dbl"),
        c("c", "i", "c", "d")
      ),
      P = hip_fwf_widths(
        c(1, 3, 1, 3, 1),
        c("rt", "hhnum",  "pernum", "per_dbl", "per_mix"),
        c("c", "i", "i", "d", "c")
      )
    ),
    hip_rt(1, 1)
  )

  first_yield <- yield$yield(4)
  ignore <- yield$yield(2)
  yield$reset()

  expect_equal(yield$yield(4), first_yield)
})

test_that("first yield equals first yield after reset (.dat.gz)", {
  yield <- hipread_list_yield(
    hipread_example("test-basic.dat.gz"),
    list(
      H = hip_fwf_positions(
        c(1, 2, 5, 8),
        c(1, 4, 7, 10),
        c("rt", "hhnum", "hh_char", "hh_dbl"),
        c("c", "i", "c", "d")
      ),
      P = hip_fwf_widths(
        c(1, 3, 1, 3, 1),
        c("rt", "hhnum",  "pernum", "per_dbl", "per_mix"),
        c("c", "i", "i", "d", "c")
      )
    ),
    hip_rt(1, 1)
  )

  first_yield <- yield$yield(4)
  ignore <- yield$yield(2)
  yield$reset()

  expect_equal(yield$yield(4), first_yield)
})

test_that("can reset after end of file is reached (.dat)", {
  yield <- hipread_list_yield(
    hipread_example("test-basic.dat"),
    list(
      H = hip_fwf_positions(
        c(1, 2, 5, 8),
        c(1, 4, 7, 10),
        c("rt", "hhnum", "hh_char", "hh_dbl"),
        c("c", "i", "c", "d")
      ),
      P = hip_fwf_widths(
        c(1, 3, 1, 3, 1),
        c("rt", "hhnum",  "pernum", "per_dbl", "per_mix"),
        c("c", "i", "i", "d", "c")
      )
    ),
    hip_rt(1, 1)
  )

  full_yield <- yield$yield()
  expect_null(yield$yield())
  yield$reset()
  expect_equal(full_yield, yield$yield())
})

test_that("can reset after end of file is reached (.dat.gz)", {
  yield <- hipread_list_yield(
    hipread_example("test-basic.dat.gz"),
    list(
      H = hip_fwf_positions(
        c(1, 2, 5, 8),
        c(1, 4, 7, 10),
        c("rt", "hhnum", "hh_char", "hh_dbl"),
        c("c", "i", "c", "d")
      ),
      P = hip_fwf_widths(
        c(1, 3, 1, 3, 1),
        c("rt", "hhnum",  "pernum", "per_dbl", "per_mix"),
        c("c", "i", "i", "d", "c")
      )
    ),
    hip_rt(1, 1)
  )

  full_yield <- yield$yield()
  expect_null(yield$yield())
  yield$reset()
  expect_equal(full_yield, yield$yield())
})

test_that("cur_pos is updated correctly", {
  yield <- hipread_long_yield(
    hipread_example("test-basic.dat"),
    list(
      H = hip_fwf_positions(
        c(1, 2, 5, 8),
        c(1, 4, 7, 10),
        c("rt", "hhnum", "hh_char", "hh_dbl"),
        c("c", "i", "c", "d")
      ),
      P = hip_fwf_widths(
        c(1, 3, 1, 3, 1),
        c("rt", "hhnum",  "pernum", "per_dbl", "per_mix"),
        c("c", "i", "i", "d", "c")
      )
    ),
    hip_rt(1, 1)
  )

  expect_equal(yield$cur_pos, 1)
  first_yield <- yield$yield(4)
  expect_equal(yield$cur_pos, 5)
  next_yield <- yield$yield(2)
  expect_equal(yield$cur_pos, 7)
  yield$reset()
  final_yield <- yield$yield(3)
  expect_equal(yield$cur_pos, 4)
})


