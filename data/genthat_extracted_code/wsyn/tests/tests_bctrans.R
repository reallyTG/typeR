context("bctrans")

test_that("test Box-Cox function, lambda zero case",{
  y<-runif(10)+.1
  expect_equal(bctrans(y,0),log(y))
  expect_equal(bctrans(y,1e-12),log(y))
})

test_that("test Box-Cox function, lambda differs from zero case",{
  y<-runif(10)+.1
  lambda<-rnorm(1,sd=3)
  expect_equal(bctrans(y,lambda),(y^lambda-1)/lambda)
})