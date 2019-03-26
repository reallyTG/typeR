context("getParmsLognormForMedianAndUpper")

test_that("getParmsLognormForMedianAndUpper",{
  mu = 2
  sd = c(1,0.8)
  p = 0.99
  med <- qlnorm(0.5, mu, sd)
  upper <- u <- qlnorm(p, mu, sd )		# p-confidence interval
  cf <- getParmsLognormForMedianAndUpper(med, upper)
  expect_equal( cf[,"mu"] , c(mu,mu) )
  expect_equal( cf[,"sigma"] , sd )
})

test_that("getParmsLognormForLowerAndUpper",{
  mu = 2
  sd = c(1,0.8)
  p = 0.99
  lower <- l <- qlnorm(1 - p, mu, sd )		# p-confidence interval
  upper <- u <- qlnorm(p, mu, sd )		# p-confidence interval
  cf <- getParmsLognormForLowerAndUpper(lower,upper)
  expect_equal( cf[,"mu"] , c(mu,mu) )
  expect_equal( cf[,"sigma"] , sd )
})

test_that("getParmsLognormForModeAndUpper",{
  thetaEst <- getParmsLognormForModeAndUpper(1,5)
  mle <- exp(thetaEst[1] - thetaEst[2]^2)
  expect_equal(mle , 1, check.attributes = FALSE)
  #
  q <- c(2,7)
  #trace(coefLognormMLE, recover)     #untrace(coefLognormMLE)
  theta <- getParmsLognormForModeAndUpper(q[1],q[2])
  tmp <- plnorm(q[2], meanlog = theta[1], sdlog = theta[2])
  q2 <- qlnorm(c(0.5,0.99), meanlog = theta[1], sdlog = theta[2])
  expect_equal(q[2],q2[2])
  mle <- exp(theta[1] - theta[2]^2)
  expect_equal(q[1],mle)
  #
  res <- getParmsLognormForModeAndUpper(1:5,q[2])
  expect_equal(5,nrow(res))
  expect_equal(res[2,,drop = FALSE], theta)
  res <- getParmsLognormForModeAndUpper(q[1],q[2] + (-2:2))
  expect_equal(5,nrow(res))
  expect_equal(res[3,,drop = FALSE], theta)
})

test_that("getParmsLognormForMeanAndUpper",{
  thetaEst <- getParmsLognormForMeanAndUpper(1,5)
  mean <- exp(thetaEst[1] + thetaEst[2]^2/2)
  expect_equal(mean , 1, check.attributes = FALSE)
  #
  q <- c(2,7)
  #trace(coefLognormMLE, recover)     #untrace(coefLognormMLE)
  theta <- getParmsLognormForMeanAndUpper(q[1],q[2])
  q2 <- qlnorm(c(0.5,0.99), meanlog = theta[1], sdlog = theta[2])
  expect_equal(q[2],q2[2])
  mean <- exp(theta[1] + theta[2]^2/2)
  expect_equal(q[1],mean)
  #
  res <- getParmsLognormForMeanAndUpper(1:5,q[2])
  expect_equal(5,nrow(res))
  expect_equal(res[2,,drop = FALSE], theta)
  res <- getParmsLognormForMeanAndUpper(q[1],q[2] + (-2:2))
  expect_equal(5,nrow(res))
  expect_equal(res[3,,drop = FALSE], theta)
})







