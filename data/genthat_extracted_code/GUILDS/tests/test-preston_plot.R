context("preston_plot")

test_that("preston_plot use", {
  skip_on_cran()
  cat("preston_plot use\n")
  theta <- 100
  m <- 0.1
  J <- 10000
  I <- m * (J - 1) / (1 - m)
  
  abund <- generate.ESF(theta, I, J)
  par(mfrow = c(1, 2))
  preston_plot(abund)
  abund.expect <- expected.SAD(theta, m, J)
  preston_plot(abund, abund.expect)
})