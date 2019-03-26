context("mrl")

test_that("mrl behaves as it should", {
  skip_on_cran()
  skip_on_travis()
    par(mfrow=c(1,1))
  res <- mrl(rain)
  res <- plot(res, , main="Figure 4.1 of Coles (2001)")
  expect_that(res, equals(NULL), label="mrlPlot:checkexecution")
}
)
