context("plot.migpd")

test_that("plot.migpd behaves as it should", {
  skip_on_cran()
  skip_on_travis()
    par(mfrow=c(2,2))
  mod <- migpd(winter, mqu=.7, penalty = "none")
  res <- plot(mod)
  expect_that(res, equals(NULL), label="plot.migpd:successfulexecution")
}
)
