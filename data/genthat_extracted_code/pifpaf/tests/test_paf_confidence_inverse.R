context("CI of PAF using inverse method")

test_that("Checking paf.confidence.inverse",{
  
  #Expect error  when confidence levels are incorrectly specified
  expect_error({
    set.seed(347618)
    X        <- as.data.frame(rnorm(100,3,1))
    thetahat <- 1.4
    thetavar <- 0.05
    rr       <- function(X,theta){exp(X*theta)}
    paf.confidence.inverse(X=X, thetahat = thetahat, rr=rr, 
                           thetavar = thetavar, method = "empirical", confidence = -1)
    
  })
  
  #Expect error  when  covariance matrix is not positive semi-definite
  
  expect_error({
    set.seed(347618)
    X        <- as.data.frame(rnorm(100,3,1))
    thetahat <- 1.4
    thetavar <- -0.05
    rr       <- function(X,theta){exp(X*theta)}
    paf.confidence.inverse(X=X, thetahat = thetahat,
                           rr=rr, thetavar = thetavar, method = "empirical")
    
  })
  
  expect_error({
    set.seed(347618)
    X        <- as.data.frame(rnorm(100,3,1))
    thetahat <- c(1.4, 1)
    thetavar <- matrix(c(.2,.9,.9, .1), ncol = 2, byrow = TRUE)
    rr       <- function(X,theta){X*theta[1]+theta[2]}
    paf.confidence.inverse(X=X, thetahat = thetahat, rr=rr,
                           thetavar = thetavar, method = "empirical")
    
  })
  
  #Check dimensions are correctly specified
  expect_error({
    set.seed(347618)
    X        <- as.data.frame(rnorm(100,3,1))
    thetahat <- .02
    thetavar <- matrix(c(.2,.01,.01, .1), ncol = 2, byrow = TRUE)
    rr       <- function(X,theta){X*theta[1]+theta[2]}
    paf.confidence.inverse(X=X, thetahat = thetahat,
                           rr=rr, thetavar = thetavar, method = "empirical")
      })
  
  #All exposure levels are zero expect paf equal to zero
  expect_equal({
    set.seed(347618)
    X        <- as.data.frame(rep(0,100))
    thetahat <- 0.2
    thetavar <- 0.02
    rr       <- function(X,theta){exp(X*theta)}
    paf.confidence.inverse(X=X, thetahat = thetahat, rr=rr, thetavar = thetavar, method = "empirical")
  },
  c("Lower_CI" = 0, "Point_Estimate" =  0 , "Upper_CI" = 0 ))
  
  
  expect_equal({
    Xmean    <- 0
    Xvar     <- 0
    thetahat <- 0.2
    thetavar <- 0.02
    rr       <- function(X,theta){exp(X*theta)}
    paf.confidence.inverse(X=Xmean, thetahat = thetahat, rr=rr, thetavar = thetavar, Xvar = Xvar, 
                           method = "approximate")
  },
  c("Lower_CI" = 0, "Point_Estimate" =  0 , "Upper_CI" = 0 )
  )
  
})
