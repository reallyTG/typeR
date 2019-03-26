context("CI of PAF using one to one method")

test_that("Checking paf.confidence.one2one",{
  
  #Expect error  when confidence levels are incorrectly specified
  expect_error({
    set.seed(347618)
    X        <- as.data.frame(rnorm(100,3,1))
    thetahat <- 1.4
    thetalow <- 1.2
    thetaup  <- 1.65
    rr       <- function(X,theta){exp(X*theta)}
    paf.confidence.one2one(X=X, thetahat = thetahat, rr=rr, thetalow = thetalow,
                           thetaup = thetaup, method = "empirical", confidence = -1)  
    })
  
  #Expect error  when thetaup isn't specified
  expect_error({
    set.seed(347618)
    X        <- as.data.frame(rnorm(100,3,1))
    thetahat <- 1.4
    thetalow <- 1.12
    rr       <- function(X,theta){exp(X*theta)}
    paf.confidence.one2one(X=X, thetahat = thetahat, rr=rr, thetalow = thetalow,
                           method = "empirical") 
    })
  
  
  #Expect error  when thetalow isn't specified
  expect_error({
    set.seed(347618)
    X        <- as.data.frame(rnorm(100,3,1))
    thetahat <- 1.4
    thetaup  <- 2.3
    rr       <- function(X,theta){exp(X*theta)}
    paf.confidence.one2one(X=X, thetahat = thetahat, rr=rr, 
                           thetaup = thetaup, method = "empirical") 
    })
 
  #Expect error when dimensions of thetahat, thetaup, and thetalow are different
  expect_error({
    set.seed(347618)
    X        <- as.data.frame(rnorm(100,3,1))
    thetahat <- 1.4
    thetalow <- c(1.3, 1)
    thetaup  <- 2.1
    rr       <- function(X,theta){exp(X*theta)}
    paf.confidence.one2one(X=X, thetahat = thetahat, rr=rr, thetalow = thetalow,
                           thetaup = thetaup, method = "empirical")
  })
  
  expect_error({
    set.seed(347618)
    X        <- as.data.frame(rnorm(100,3,1))
    thetahat <- c(1.4, 1.3)
    thetalow <- c(.01, .04)
    thetaup  <- 1.5
    rr       <- function(X,theta){exp(X*theta[1]*theta[2])}
    paf.confidence.one2one(X=X, thetahat = thetahat, rr=rr, thetalow = thetalow,
                           thetaup = thetaup, method = "empirical") 
    })
  
  #Expect error if thetalow > thetahat or thetaup < thetahat
  expect_error({
    set.seed(347618)
    X        <- as.data.frame(rnorm(100,3,1))
    thetahat <- c(1.4, 1.3)
    thetalow <- c(1.1, 1.2)
    thetaup  <- c(1.5, 1.2)
    rr       <- function(X,theta){exp(X*theta[1]*theta[2])}
    paf.confidence.one2one(X=X, thetahat = thetahat, rr=rr, thetalow = thetalow,
                           thetaup = thetaup, method = "empirical") 
    })
  
  expect_error({
    set.seed(347618)
    X        <- as.data.frame(rnorm(100,3,1))
    thetahat <- c(1.4, 1.3)
    thetalow <- c(1.1, 1.32)
    thetaup  <- c(1.5, 1.4)
    rr       <- function(X,theta){exp(X*theta[1]*theta[2])}
    paf.confidence.one2one(X=X, thetahat = thetahat, rr=rr, thetalow = thetalow,
                           thetaup = thetaup, method = "empirical") 
    })
  
  #Error using approximate method and no value for Xvar
  expect_error({
    Xmean    <- (2.3)
    thetahat <- c(1.4, 1.3)
    thetalow <- c(1.1, 1.23)
    thetaup  <- c(1.5, 1.4)
    rr       <- function(X,theta){exp(X*theta[1]*theta[2])}
    paf.confidence.one2one(X=Xmean, thetahat = thetahat, rr=rr, thetalow = thetalow,
                           thetaup = thetaup, method = "approximate")  
    })
  
  #Expect equal to zero when exposure is zero and variance of exposure is zero
  
  expect_equal({
    Xmean    <- as.data.frame(rep(0, 100))
    thetahat <- c(1.4, 1.3)
    thetalow <- c(1.1, 1.23)
    thetaup  <- c(1.5, 1.4)
    rr       <- function(X,theta){exp(X*theta[1]*theta[2])}
    paf.confidence.one2one(X=Xmean, thetahat = thetahat, rr=rr, thetalow = thetalow,
                           thetaup = thetaup, method = "empirical") 
    }, c("Lower_CI" = 0, "Point_Estimate" = 0, "Upper_CI" = 0))
  
  
  expect_equal({
    Xmean    <- as.data.frame(0)
    Xvar     <- 0
    thetahat <- c(1.4, 1.3)
    thetalow <- c(1.1, 1.23)
    thetaup  <- c(1.5, 1.4)
    rr       <- function(X,theta){exp(X*theta[1]*theta[2])}
    paf.confidence.one2one(X=Xmean, thetahat = thetahat, rr=rr, thetalow = thetalow,
                           thetaup = thetaup, method = "approximate", Xvar=Xvar)  
    },
    c("Lower_CI" = 0, "Point_Estimate" = 0, "Upper_CI" = 0))
})