.tmp.f <- function(){
  require(testthat)  
}
context("lognormal")

test_that("getLognormMoments and getParmsLognormFromMoments vector",{
  mu = log(100)
  sigma = log(1.2)
  moments = getLognormMoments(mu, sigma)
  coefEst <- getParmsLognormForMoments( moments[,1], moments[,2])
  expect_equal( c(mu = mu, sigma = sigma), coefEst[1,])
})

test_that("getLognormMoments and getParmsLognormFromMoments matrix",{
  mu = log(c(100,200))
  sigma = rep(log(1.2),2)
  moments = getLognormMoments(mu, sigma)
  coefEst <- getParmsLognormForMoments( moments[,1], moments[,2])
  expect_equal( cbind(mu = mu, sigma = sigma), coefEst)
})

test_that("getParmsLognormFromExpValue matrix",{
  mu = log(c(100,200))
  sigma = rep(log(1.2),2)
  moments = getLognormMoments(mu, sigma)
  coefEst <- getParmsLognormForExpval( moments[,1], exp(sigma))
  expect_equal( cbind(mu = mu, sigma = sigma), coefEst)
})

test_that("getLognormMedian",{
  mu = log(c(100,200))
  sigma = rep(log(1.2),2)
  ans = getLognormMedian(mu, sigma)
  expect_equal( exp(mu), ans)
})

test_that("getLognormMode",{
  mu = log(c(100,200))
  sigma = rep(log(1.2),2)
  mode = getLognormMode(mu, sigma)
  expect_equal( exp(mu - sigma^2), mode)
})


