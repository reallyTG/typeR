context("plot.chi")

test_that("plot.chi behaves as it should", {
  skip_on_cran()
  skip_on_travis()
  chi <- chi(wavesurge)
  par(mfrow=c(1,2),pty="m")
  res <- plot(chi,mainChiBar="Figure 8.11 of Coles (2001)\nChi Bar")
  plot(chi, show=c("Chi"=FALSE,"ChiBar"=TRUE))
  plot(chi, show=c("Chi"=TRUE,"ChiBar"=FALSE))
  expect_that(res, equals(NULL), label="plot.chi:checksuccessfulexecution")
}
)
