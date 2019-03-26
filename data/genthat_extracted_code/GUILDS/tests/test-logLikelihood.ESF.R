context("logLikelihood.ESF")

test_that("logLikelihood.ESF: use", {
  skip_on_cran()
  set.seed(42)
  J <- 10000
  theta <- 100
  m <- 0.1
  I <- m * (J-1) / (1 - m)
  
  abund <- generate.ESF(theta, I, J)  
  LL1 <- logLikelihood.ESF(theta, m, abund)
  LL2 <- logLikelihood.ESF(theta * 2, m * 2, abund)
  
  a <- LL1[[1]] > LL2[[1]]
  expect_equal(a,TRUE)
})
  
test_that("logLikelihood.ESF: abuse", {
  skip_on_cran()
  set.seed(42)
  J <- 10000
  theta <- 100
  m <- 0.1
  I <- m * (J-1) / (1 - m)
  
  abund <- generate.ESF(theta, I, J)  
  LL1 <- logLikelihood.ESF(-10, m, abund)
  expect_equal(is.infinite(LL1[[1]]), TRUE)
  LL1 <- logLikelihood.ESF(theta, 2, abund)
  expect_equal(is.infinite(LL1[[1]]), TRUE)
  
})