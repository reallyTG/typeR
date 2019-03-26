context("calc_ranges")

test_that("calc ranges without a fraction", {
  expect_equal(
    calc_ranges(
      first_offset = 0L,
      max_records = 1000L,
      records_per_request = 100L
    ),
    dplyr::data_frame(
      offsets = c(  0L, 100L, 200L, 300L, 400L, 500L, 600L, 700L, 800L, 900L),
      limits  = c(100L, 100L, 100L, 100L, 100L, 100L, 100L, 100L, 100L, 100L)
    )
  )
})

test_that("calc ranges with one length short", {
  expect_equal(
    calc_ranges(
      first_offset = 0L,
      max_records = 999L,
      records_per_request = 100L
    ),
    dplyr::data_frame(
      offsets = c(  0L, 100L, 200L, 300L, 400L, 500L, 600L, 700L, 800L, 900L),
      limits  = c(100L, 100L, 100L, 100L, 100L, 100L, 100L, 100L, 100L,  99L)
    )
  )
})

test_that("calc ranges with one length over", {
  expect_equal(
    calc_ranges(
      first_offset = 0L,
      max_records = 1001L,
      records_per_request = 100L
    ),
    dplyr::data_frame(
      offsets = c(  0L, 100L, 200L, 300L, 400L, 500L, 600L, 700L, 800L, 900L, 1000L),
      limits  = c(100L, 100L, 100L, 100L, 100L, 100L, 100L, 100L, 100L, 100L,    1L)
    )
  )
})

test_that("calc ranges without a fraction and with offset", {
  expect_equal(
    calc_ranges(
      first_offset = 1L,
      max_records = 1000L,
      records_per_request = 100L
    ),
    dplyr::data_frame(
      offsets = c(  1L, 101L, 201L, 301L, 401L, 501L, 601L, 701L, 801L, 901L),
      limits  = c(100L, 100L, 100L, 100L, 100L, 100L, 100L, 100L, 100L, 100L)
    )
  )
})

test_that("calc ranges without a fraction and with offset", {
  expect_equal(
    calc_ranges(
      first_offset =1001L,
      max_records = 1000L,
      records_per_request = 100L
    ),
    dplyr::data_frame(
      offsets = c(1001L, 1101L, 1201L, 1301L, 1401L, 1501L, 1601L, 1701L, 1801L, 1901L),
      limits  = c( 100L,  100L,  100L,  100L,  100L,  100L,  100L,  100L,  100L,  100L)
    )
  )
})
