context("Check PAF point estimate")

test_that("Checking paf point estimate",{
  
  #Warning for negative exposure values
  expect_warning({
    X        <- data.frame(c(1,4,2,-1,2,1,1,0,0,1,2))
    thetahat <- 1
    rr       <- function(X,theta){X*theta+1}
    paf(X, thetahat, rr)
  })
  
  #Check errors and warnings for negative theta values
  expect_warning({
    X        <- data.frame(c(1,4,2,1,2,1,1,0,0,1,2))
    thetahat <- -1
    rr       <- function(X,theta){X*theta+1}
    paf(X, thetahat, rr)
  })
  
  expect_warning({
    X        <- data.frame(c(1,4,2,1,2,1,1,0,0,1,2))
    thetahat <- -.2
    rr       <- function(X,theta){X*theta+1}
    paf(X, thetahat, rr)
  })
  
  #Check errors for decreasing rr functions
  
  expect_warning({
    X        <- data.frame(c(1,4,2,1,2,1,1,0,0,1,2))
    thetahat <- 1
    rr       <- function(X,theta){-X*theta+1}
    paf(X, thetahat, rr)
  })
  
  #Check warning when rr(0)!=1
  expect_warning({
    X        <- data.frame(c(1,4,2,1,2,1,1,0,0,1,2))
    thetahat <- 1
    rr       <- function(X,theta){X*theta+21}
    paf(X, thetahat, rr)
  })
  
  #Verify results are correct
  expect_equal({
    X        <- data.frame(c(1,4,2,1,2,1,1,0,0,1,2))
    thetahat <- 1
    rr       <- function(X,theta){X*theta+1}
    round(paf(X, thetahat, rr),2)
  },
  {
    round(1-1/(mean(X[,1])+1),2)
  })
  
  expect_equal({
    set.seed(123413)
    X        <- data.frame(rep(0,100))
    thetahat <- 0.02
    rr       <- function(X,theta){X*theta +1}
    paf(X, thetahat, rr)
    
  },
  0
  )
  
  
})
