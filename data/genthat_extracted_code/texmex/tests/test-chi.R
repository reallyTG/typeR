context("chi")

test_that("chi behaves as it should", {
  # independent implementation of chi and chibar, Janet Heffernan personal code library
  
  
  .ChiFunction <- function(data, nLevels){
    .Cfunction <- function(data, nLevels){
      rowWiseMax <- apply(data, 1, max)
      rowWiseMin <- apply(data, 1, min)
      u <- seq(min(rowWiseMax) + 1/(2 * nLevels), max(rowWiseMin) - 1/(2 * nLevels), length = nLevels)
      Cu <- sapply(1:nLevels,function(i, rmax, u){ mean(rmax < u[i]) }, rmax = rowWiseMax, u=u)
      CbarU <- sapply(1:nLevels,function(i, rmin, u){ mean(rmin > u[i]) }, rmin=rowWiseMin, u=u)
      list(u = u, Cu = Cu, CbarU = CbarU)
    } 
    TransUniform <- function(x){
      .transUniform <- function(x){
        if (is.R()){
          rank(x,ties.method="first") / (length(x) + 1) # original version
        }
        else {
          rank(x) / (length(x) + 1) # original version
        }
      }
      
      
      if(length(dim(x)) > 0)apply(x,2,.transUniform)
      else .transUniform(x)
    } 
    C <- .Cfunction(TransUniform(data), nLevels = nLevels)
    u <- C$u
    Cu <- C$Cu
    CbarU <- C$CbarU
    ChiU <- 2 - log(Cu)/log(u)
    ChiBarU <- (2 * log(1 - u))/log(CbarU) - 1
    n <- nrow(data)
    
    #variances of chi and chibar
    varChi <- ((1/log(u)^2 * 1)/Cu^2 * Cu * (1 - Cu))/n
    varChiBar <- (((4 * log(1 - u)^2)/(log(CbarU)^4 * CbarU^2)) * CbarU * (1 - CbarU))/n
    
    #upper and lower 95% conf int bounds for chi and chibar; these are based on normal approx with further functional constraints imposed
    z.975 <- qnorm(1 - 0.05/2)
    ChiLower <- ChiU - z.975 * sqrt(varChi)
    ChiUpper <- ChiU + z.975 * sqrt(varChi)
    
    ChiLbound <- numeric(length(u))
    ChiLbound[u>0.5] <- 2 - log(2 *u[u > 0.5] - 1)/log(u[u > 0.5])
    ChiLbound[u<=0.5] <- -Inf
    
    ChiLower <- apply(cbind(ChiLower, ChiLbound), 1, max)
    ChiUpper[ChiUpper > 1] <- 1
    
    ChiBarLower <- ChiBarU - z.975 * sqrt(varChiBar)
    ChiBarUpper <- ChiBarU + z.975 * sqrt(varChiBar)
    ChiBarLower[ChiBarLower < -1] <- -1
    ChiBarUpper[ChiBarUpper > 1] <- 1
    
    list(u = C$u, Cu = C$Cu, CbarU = C$CbarU, 
         Chi = ChiU, ChiBar = ChiBarU, 
         ChiLower = ChiLower, ChiUpper = ChiUpper,
         ChiBarLower = ChiBarLower, ChiBarUpper = ChiBarUpper,
         n = n)
  }
  
  
  
  #*************************************************************
  
  nq <- 1000
  chi.JH <- .ChiFunction(wavesurge,nLevels=nq)
  chi <- chi(wavesurge,nq=nq,qlim=range(chi.JH$u),trunc= TRUE)
  
  expect_equal(chi.JH$u, chi$quantile, label="chi:u")
  expect_equal(chi.JH$Chi, chi$chi[, 2], label="chi:Chi")
  expect_equal(chi.JH$ChiLower, chi$chi[, 1], label="chi:ChiLower")
  expect_equal(chi.JH$ChiUpper, chi$chi[, 3], label="chi:ChiUpper")
  expect_equal(chi.JH$ChiBar, chi$chibar[, 2], label="chi:ChiBar")
  expect_equal(chi.JH$ChiBarLower, chi$chibar[, 1], label="chi:ChiBarLower")
  expect_equal(chi.JH$ChiBarUpper, chi$chibar[, 3], label="chi:ChiBarUpper")
}
)
