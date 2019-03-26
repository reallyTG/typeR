.tmp.f <- function(){
  require(testthat)
  #
  require(Matrix)
  require(tidyr)
  require(dplyr)
  require(ggplot2)
}
context("sumLognormal")

test_that("estimateSumLognormal two Vars",{
  # generate nSample values of two lognormal random variables
  mu1 = log(110)
  mu2 = log(100)
  sigma1 = 0.25
  sigma2 = 0.15
  #estimateSumLognormalBenchmark( c(mu1,mu2), c(sigma1,sigma2) )
  coefSum <- estimateSumLognormal( c(mu1,mu2), c(sigma1,sigma2) )
  expect_equal( coefSum["mu"], c(mu = log(210)), tolerance = 0.02 )
  # regression to previous result checked with random numbers below
  expect_equal(
    exp(coefSum["sigma"]),  c(sigma = 1.16087), tolerance = 0.02 )
  #
  .tmp.f <- function(){
    nSample = 500
    ds <- data.frame(
      x1 = rlnorm(nSample, mu1, sigma1)
      , x2 = rlnorm(nSample, mu2, sigma2)
    ) %>%  mutate(
      y = x1 + x2
    )
    dsw <- gather(ds, "var", "value", x1, x2, y)
    p1 <- ggplot(dsw, aes(value, color = var)) + geom_density(linetype = "dotted")
    #
    p <- seq(0,1,length.out = 32)[-c(1,32)]
    dsPred1 <- data.frame(
      var = "x1", q = qlnorm(p, mu1, sigma1 )
    ) %>%
      mutate( d = dlnorm(q, mu1, sigma1))
    dsPred2 <- data.frame(
      var = "x2", q = qlnorm(p, mu2, sigma2 )
    ) %>%
      mutate( d = dlnorm(q, mu2, sigma2))
    dsPred <- rbind(dsPred1, dsPred2)
    p1 + geom_line(data = dsPred, aes(q, d))
    #
    coefSum <- estimateSumLognormal( c(mu1,mu2), c(sigma1,sigma2) )
    dsPredY <- data.frame(
      var = "y", q = qlnorm(p, coefSum["mu"], coefSum["sigma"] )
    ) %>%
      mutate( d = dlnorm(q, coefSum["mu"], coefSum["sigma"]))
    dsPred <- rbind(dsPred1, dsPred2, dsPredY)
    p1 + geom_line(data = dsPred, aes(q, d))

  }
})

test_that("estimateSumLognormal correlated, few Vars",{
  if (!requireNamespace("mvtnorm")) skip("mvtnorm not installed.")
  # generate 500 samples of a sum of five correlated lognormal
  mu = log(c(110,100,80,120,160))
  sigma = log(c(1.2,1.5,1.1,1.3,1.1))
  acf1 <- c(0.4,0.1)
  corrM <- setMatrixOffDiagonals(
    diag(nrow = length(mu)), value = acf1, isSymmetric = TRUE)
  nSample = 500
  rM <- exp(mvtnorm::rmvnorm(nSample, mean = mu, sigma = diag(sigma) %*% corrM %*% diag(sigma)))
  #
  coefSum <- estimateSumLognormal(mu, sigma, corr = corrM )
  expect_equal( coefSum["mu"], c(mu = log(sum(exp(mu)))), tolerance = 0.02 )
  # regression to previous result checked with random numbers below
  expect_equal(
    exp(coefSum["sigma"]),  c(sigma = 1.133632), tolerance = 0.02 )
  #
  # repeat with constraining correlation length
  coefSum2 <- estimateSumLognormal(
    mu, sigma, corr = corrM, corrLength = length(acf1) )
  expect_equal( coefSum2, coefSum )
  #
  # repeat without correlations
  coefSum3 <- estimateSumLognormal(
    mu, sigma, corr = corrM, corrLength = 0 )
  expect_true( coefSum3["sigma"] < coefSum["sigma"])
  #
  .tmp.f <- function(){
    #install.packages("mvtnorm")
    ds <- data.frame(
      value = apply(rM, 1, sum)
    )
    p2 <- ggplot(ds, aes(value)) + geom_density(linetype = "dotted")
    #
    coefSum <- estimateSumLognormal(mu, sigma, corr = corrM )
    p <- seq(0,1,length.out = 42)[-c(1,32)]
    dsPredY <- dsPred <- data.frame(
      var = "y", q = qlnorm(p, coefSum["mu"], coefSum["sigma"] )
    ) %>%
      mutate( d = dlnorm(q, coefSum["mu"], coefSum["sigma"]))
    p2 + geom_line(data = dsPred, aes(q, d))
  }
})

test_that("estimateSumLognormal few terms",{
  mu = log(c(110,100,80))
  sigma = log(rep(1.2, length(mu)))
  # no finite case
  sigma0 <- sigma; sigma0[] <- NA
  coefSum <- estimateSumLognormal(mu, sigma0, na.rm = TRUE)
  expect_equal(coefSum, c(mu = NA_real_, sigma = NA_real_))
  coefSum <- estimateSumLognormal(mu, sigma0)
  expect_equal(coefSum, c(mu = NA_real_, sigma = NA_real_))
  expect_error(
    coefSum <- estimateSumLognormal(mu, sigma0, isStopOnNoTerm = TRUE))
  # one finite case
  sigma1 <- sigma; sigma1[-1] <- NA
  coefSum <- estimateSumLognormal(mu, sigma1)
  expect_equal(coefSum, c(mu = NA_real_, sigma = NA_real_))
  coefSum <- estimateSumLognormal(mu, sigma1, na.rm = TRUE)
  expect_equal(coefSum, c(mu = mu[1], sigma = sigma1[1]))
})

test_that("estimateSumLognormalSample",{
  if (!requireNamespace("mvtnorm")) skip("mvtnorm not installed.")
  # generate sum of nSample correlated lognormals
  nSample <- 60
  mu = log(100 + 10*sin((1:nSample)*pi/nSample))
  sigma = rep(log(1.2), nSample)
  acf1 <- c(1, 0.9, 0.05)
  # corrM <- setMatrixOffDiagonals(
  #   diag(nrow = length(mu)), value = acf1, isSymmetric = TRUE)
  corrM <- getCorrMatFromAcf(nSample, acf1)
  diagSigma <- Diagonal(x = sigma)
  rM <- suppressWarnings(as.vector(exp(mvtnorm::rmvnorm(
    1, mean = mu
    , sigma = as.matrix(diagSigma %*% corrM %*% diagSigma)))))
  resLog <- log(rM) - mu
  #effAcf <- computeEffectiveAutoCorr(resLog)
  coefSum <- estimateSumLognormalSample(mu, sigma, resLog)
  # test that medians add up 
  expect_equal( coefSum["mu"], c(mu = log(sum(exp(mu)))), tolerance = 0.02 )
  # regression to previous result
  # anticipated smaller than original exp(sigma) of 1.2
  expect_equal(
    exp(coefSum["sigma"]),  c(sigma = 1.052405), tolerance = 0.02 )
  expect_true( coefSum["nEff"] < nSample )
  .tmp.f <- function(){
    plot(resLog)
    plot(rM)
    points(exp(mu), col = "green")
    # s* mutliplier at original scale
    c( exp(sigma[1]), exp(coefSum["sigma"]) )
    getLognormMoments( coefSum[1], coefSum[2]^2 )
    getLognormMoments( log(100), sigma[1]^2 )
  }
})

test_that("estimateSumLognormalSampleGapfilled",{
  # here use uncorrelated sample to not require mvtnorm
  nSample <- 60
  mu = muTerms <- log(100 + 10*sin((1:nSample)*pi/nSample))
  sigma = sigmaTerms <- rep(log(1.2), nSample)
  momentsTerms <- getLognormMoments(mu, sigma)
  rM <- rlnorm(nSample, mu, sigma)
  resLog <- log(rM) - mu
  isGapFilled <- logical(nSample)
  isGapFilled[10:30] <- TRUE
  coefSum <- estimateSumLognormalSample(
    mu, sigma, resLog, isGapFilled = isGapFilled)
  momentsSum <- getLognormMoments(coefSum["mu"], coefSum["sigma"])[1,]
  # adding the means is conserved
  expect_equal( unname(momentsSum["mean"]), sum(momentsTerms[,"mean"]) )
  # anticipated smaller than origina exp(sigma) of 1.2
  expect_true( coefSum["sigma"] < sigma[1])
  # regression to previous result
  expect_equal(
    exp(coefSum["sigma"]),  c(sigma = 1.029), tolerance = 0.02 )
  #expect_true( coefSum["nEff"] == nSample ) # subject to random
  .tmp.f <- function(){
    plot(resLog)
    plot(rM)
    points(exp(mu), col = "green")
    # s* mutliplier at original scale
    c( exp(sigma[1]), exp(coefSum["sigma"]) )
    getLognormMoments( coefSum[1], coefSum[2]^2 )
    getLognormMoments( log(100), sigma[1]^2 )
  }
})

test_that("sumDecrease",{
  # here use uncorrelated sample to not require mvtnorm
  nObs <- 1000
  xTrue <- rep(10, nObs)
  sigmaStar <- rep(1.5, nObs) # multiplicative stddev of 1.2
  theta <- getParmsLognormForExpval(xTrue, sigmaStar)
  # generate observations with correlated errors
  # # acf1 <- c(0.4,0.1)
  # # corrM <- setMatrixOffDiagonals(
  # #   diag(nrow = nObs), value = acf1, isSymmetric = TRUE)
  # xObsN <- exp(mvtnorm::rmvnorm(
  #   100, mean = theta[,1]
  #   , sigma = diag(theta[,2]) %*% corrM %*% diag(theta[,2])))
  nRep = 30
  xObsN <- matrix(NA_real_, nrow = nRep, ncol = nObs)
  for (i in 1:nRep) {
    xObsN[i,] <- xObs <- exp(rnorm(nObs, theta[,1], theta[,2]))
    #plot(density(xObs)); mean(xObs)
  }
  sums <- rowSums(xObsN)
  summary(sums)
  #plot(density(rowSums(xObsN))); abline(v = sum(xTrue))
  coefSample <- estimateParmsLognormFromSample(sums)
  coefSum <- estimateSumLognormal( theta[,1], theta[,2])
  expect_equal(coefSum, coefSample, tolerance = 0.01)
})





