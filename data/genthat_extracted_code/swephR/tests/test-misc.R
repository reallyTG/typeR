context("Misc tests")

test_that("day_of_week works", {
  expect_equal(swe_day_of_week(1234.567), 3)
})

test_that("day_of_week works with vector input", {
  expect_equal(swe_day_of_week(c(1234.567, 1235.67)), c(3, 4))
})

test_that("tidal accelaration can be retrieved", {
  expect_equal(swe_get_tid_acc(), -25.8)
})

test_that("tidal accelaration can be set and retrieved", {
  swe_set_tid_acc(1.23)
  expect_equal(swe_get_tid_acc(), 1.23)
  swe_close()
})

test_that("deltat can be retrieved", {
    if (requireNamespace("swephRdata", quietly = TRUE))
        expect_equal(swe_deltat(1234.567), 1.5976757, tolerance = .0000001)
    else
        expect_equal(swe_deltat(1234.567), 1.58738640540236, tolerance = .0000001)
})

test_that("deltat can be retrieved for vector", {
    if (requireNamespace("swephRdata", quietly = TRUE))
        expect_equal(swe_deltat(c(1234.567, 1234567)), c(1.5976757, 0.3685434), tolerance = .0000001)
    else
        expect_equal(swe_deltat(c(1234.567, 1234567)), c(1.5873864, 0.366039979375346), tolerance = .0000001)
})

test_that("deltat can be set and retrieved", {
  swe_set_delta_t_userdef(1.23456)
  expect_equal(swe_deltat(1234.567), 1.23456)
  swe_set_delta_t_userdef(-1E-10) # SE_DELTAT_AUTOMATIC
})

test_that("deltat can be retrieved with SEFLG_MOSEPH", {
    result <- swe_deltat_ex(1234.567, 4)
    expect_true(is.list(result))
    expect_equal(result$serr, "")
    expect_equal(result$deltat, 1.5873865, tolerance = .0000001)
})

test_that("deltat can be retrieved with SEFLG_MOSEPH for vector", {
    result <- swe_deltat_ex(c(1234.567, 1234567), 4)
    expect_true(is.list(result))
    expect_equal(result$serr, c("", ""))
    expect_equal(result$deltat, c(1.5873865, 0.36604), tolerance = .0000001)
})

test_that("deltat can be retrieved with SEFLG_SWIEPH", {
    skip_if_not_installed("swephRdata")
    result <- swe_deltat_ex(1234.567, 2)
    expect_true(is.list(result))
    expect_equal(result$serr, "")
    expect_equal(result$deltat, 1.5976757, tolerance = .0000001)
})

test_that("deltat can be retrieved with SEFLG_SWIEPH for vector", {
    skip_if_not_installed("swephRdata")
    result <- swe_deltat_ex(c(1234.567, 1234567), 2)
    expect_true(is.list(result))
    expect_equal(result$serr, c("", ""))
    expect_equal(result$deltat, c(1.5976757, 0.3685434), tolerance = .0000001)
})

test_that("version works", {
    expect_equal(swe_version(), "2.07.01")
})


test_that("Converting calander date into Julian day number", {
  result <- swe_julday(2000,1,1,12,1)
  expect_equal(result, 2451545)
})
