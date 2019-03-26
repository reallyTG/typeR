context("test-plots")

test_that("equal length plot is as expected", {
  skip_on_cran()
  bins <- rbin_equal_length(mbank, y, age, 10)
  p <- plot(bins)
  vdiffr::expect_doppelganger("el plot", p$plot)
})

test_that("manual plot is as expected", {
  skip_on_cran()
  bins <- rbin_manual(mbank, y, age, c(29, 31, 34, 36, 39, 42, 46, 51, 56))
  p <- plot(bins)
  vdiffr::expect_doppelganger("ml plot", p$plot)
})

test_that("quantiles plot is as expected", {
  skip_on_cran()
  bins <- rbin_quantiles(mbank, y, age, 10)
  p <- plot(bins)
  vdiffr::expect_doppelganger("ql plot", p$plot)
})

test_that("winsorize plot is as expected", {
  skip_on_cran()
  bins <- rbin_winsorize(mbank, y, age, 10, winsor_rate = 0.05)
  p <- plot(bins)
  vdiffr::expect_doppelganger("wl plot", p$plot)
})

test_that("factor plot is as expected", {
  skip_on_cran()
  bins <- rbin_factor(mbank, y, education)
  p <- plot(bins)
  vdiffr::expect_doppelganger("fl plot", p$plot)
})