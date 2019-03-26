library(tactile)

test_that("We receive the proper classes", {
  fit <- stats::lm(rnorm(100) ~ runif(100))

  tmp <- tempfile()
  png(filename = tmp)

  expect_error(xyplot(fit), NA)

  expect_is(xyplot(fit, which = 1:6), "list")
  expect_is(xyplot(fit, which = 1), "trellis")

  dev.off()
  unlink(tmp)
})

test_that("xyplot.lm throws errors with incorrect input", {
  fit <- stats::lm(rnorm(100) ~ runif(100))
  expect_error(xyplot(fit, which = "something"))
})

test_that("normal plotting works", {
  expect_error(dont_plot(
    bwplot2(variety ~ yield,
            groups = site,
            data = barley,
            par.settings = tactile.theme())),
    NA)
})

