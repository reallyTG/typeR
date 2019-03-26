library(serrsBayes)
context("Implementation of Lorentzian and Gaussian broadening functions in Rcpp.")

test_that("weightedGaussian computes the spectral signature", {
  Cal_V <- seq(300,400,by=5)
  loc <- c(320,350,375)
  scG <- c(10,5,1)
  amp <- c(100,500,200)
  N_WN_Cal <- length(Cal_V)
  N_Peaks <- length(loc)
  Sigi<-rep(0,N_WN_Cal)
  for(j in 1:N_Peaks) {
    Sigi <- Sigi + amp[j]*sqrt(2*pi)*scG[j]*dnorm(Cal_V, loc[j], scG[j])
  }
  expect_equal(weightedGaussian(loc,scG,amp,Cal_V), Sigi)
})

test_that("weightedLorentzian computes the spectral signature", {
  Cal_V <- seq(300,400,by=5)
  loc <- c(320,350,375)
  scL <- c(3,20,7)
  amp <- c(100,500,200)
  N_WN_Cal <- length(Cal_V)
  N_Peaks <- length(loc)
  Sigi<-rep(0,N_WN_Cal)
  for(j in 1:N_Peaks) {
    Sigi <- Sigi + amp[j]*pi*scL[j]*dcauchy(Cal_V, loc[j], scL[j])
  }
  expect_equal(weightedLorentzian(loc,scL,amp,Cal_V), Sigi)
})

