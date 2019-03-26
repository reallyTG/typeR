context("ZeroCurve")

test_that("build_zero_curve works", {
  expect_is(build_zero_curve(), "ZeroCurve")
})

test_that("Interpolation checks work", {
  expect_true(is.ConstantInterpolation(ConstantInterpolation()))
  expect_true(is.LinearInterpolation(LinearInterpolation()))
  expect_true(is.LogDFInterpolation(LogDFInterpolation()))
  expect_true(is.CubicInterpolation(CubicInterpolation()))
  expect_true(is.Interpolation(CubicInterpolation()))
  expect_false(is.CubicInterpolation(ConstantInterpolation()))
})


test_that("Interpolation works", {
  # Constant
  zc <- build_zero_curve(ConstantInterpolation())
  af <- stats::approxfun(zc$pillar_times, zc$pillar_zeros, "constant")
  expect_equal(interpolate(zc, c(0, 4, 6, 50)),
    c(head(zc$pillar_zeros, 1), af(c(4, 6)), tail(zc$pillar_zeros, 1)))

  # Linear
  zc <- build_zero_curve(LinearInterpolation())
  af <- stats::approxfun(zc$pillar_times, zc$pillar_zeros, "linear")
  expect_equal(interpolate(zc, c(0, 4, 6, 50)),
    c(head(zc$pillar_zeros, 1), af(c(4, 6)), tail(zc$pillar_zeros, 1)))

  # LogDF
  zc <- build_zero_curve(LogDFInterpolation())
  af <- stats::approxfun(zc$pillar_times, -zc$pillar_times * zc$pillar_zeros, "linear")
  expect_equal(interpolate(zc, c(0, 4, 6, 50)),
    c(head(zc$pillar_zeros, 1), -af(c(4, 6)) / c(4, 6), tail(zc$pillar_zeros, 1)))

  # Natural spline
  zc <- build_zero_curve(CubicInterpolation())
  sf <- stats::splinefun(zc$pillar_times, zc$pillar_zeros, "natural")
  expect_equal(interpolate(zc, c(0, 4, 6, 50)),
    c(head(zc$pillar_zeros, 1), sf(c(4, 6)), tail(zc$pillar_zeros, 1)))

})


test_that("Higher level interpolation works", {
  zc <- build_zero_curve(ConstantInterpolation())
  expect_is(interpolate_zeros(zc, lubridate::ymd(20161231, 20171231)),
    "InterestRate")
  expect_is(interpolate_dfs(zc, lubridate::ymd(20151231), lubridate::ymd(20161231)),
    "DiscountFactor")
  expect_is(interpolate_fwds(zc, lubridate::ymd(20151231), lubridate::ymd(20161231)),
    "InterestRate")
})