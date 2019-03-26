context("Check_thetas")

test_that("Checking check.thetas",{

  
  #Check that method needs to be specified
  expect_error({
    thetahat <- 0.2
    thetavar <- 0.005
    check.thetas(thetavar, thetahat)
  })
  
  #Check that thetahat is needed
  expect_error({
    thetavar <- 0.005
    method   <- "one2one"
    check.thetas(thetavar, method = method)
  })
  
  expect_error({
    thetavar <- 0.005
    method   <- "log"
    check.thetas(thetavar, method = method)
  })
  
  #Check thetavar and thetasd have correct dimensions
  expect_error({
    thetahat <- c(0.1,0.4)
    thetavar <- 0.005
    method   <- "log"
    check.thetas(thetavar, thetahat, method = method)
  })
  
  expect_error({
    thetahat <- 0.2
    thetavar <- c(0,2,1,3)
    method   <- "log"
    check.thetas(thetavar, thetahat, method = method)
  })
  
  #Check that for one2one method thetalow and theta up need to be specified
  expect_error({
    thetahat <- 0.2
    thetavar <- 0.005
    method   <- "one2one"
    check.thetas(thetavar, thetahat, method = method)
  })
  
  #Check that for one2one method thetalow and theta up need to be specified
  expect_error({
    thetahat <- 0.2
    thetavar <- 0.005
    thetalow <- 0
    method   <- "one2one"
    check.thetas(thetavar, thetahat, thetalow, method = method)
  })
  
  #Check that it stops if dimensions of thetahat, thetalow, and thetaup are different for one2one method
  expect_error({
    thetahat <- 0.2
    thetavar <- 0.005
    thetalow <- 0
    thetaup  <- c(.3,.35)
    method   <- "one2one"
    check.thetas(thetavar, thetahat, thetalow, thetaup, method = method)
  })
  
  expect_error({
    thetahat <- 0.2
    thetavar <- 0.005
    thetalow <- c(0,.1)
    thetaup  <- .3
    method   <- "one2one"
    check.thetas(thetavar, thetahat, thetalow, thetaup, method = method)
  })
  
  expect_error({
    thetahat <- c(0.2, .21)
    thetavar <- 0.005
    thetalow <- .18
    thetaup  <- .3
    method   <- "one2one"
    check.thetas(thetavar, thetahat, thetalow, thetaup, method = method)
  })
  
  #Expect error when thetalow > thetahat
  expect_error({
    thetahat <- 0.2
    thetavar <- 0.005
    thetalow <- .21
    thetaup  <- .3
    method   <- "one2one"
    check.thetas(thetavar, thetahat, thetalow, thetaup, method = method)
  })
  
  #Expect error when thetaup < tetahat
  expect_error({
    thetahat <- 0.2
    thetavar <- 0.005
    thetalow <- .18
    thetaup  <- .19
    method   <- "one2one"
    check.thetas(thetavar, thetahat, thetalow, thetaup, method = method)
  })
  
  #Check thetavar is necessary for other methods
  expect_error({
    thetahat <- 0.2
    thetalow <- .18
    thetaup  <- .19
    method   <- "log"
    check.thetas(thetahat = thetahat, thetalow = thetalow, thetaup = thetaup, method = method)
  })
  
  #Check matrix variance is positive semi-definite
  
  expect_error({
    thetahat <- 0.9
    thetavar <- -.01
    method   <- "log"
    check.thetas(thetavar, thetahat, method = method)
  })
  
  expect_error({
    thetahat <- c(1.1, 1.2)
    thetavar <- matrix(c(-.81,.11,.11,.56), byrow = TRUE, ncol = 2)
    method   <- "log"
    check.thetas(thetavar, thetahat, method = method)
  })
  
  expect_error({
    thetahat <- c(1.1, 1.2)
    
    thetavar <- matrix(c(.81,.93,.93,.56), byrow = TRUE, ncol = 2)
    method   <- "log"
    check.thetas(thetavar, thetahat, method = method)
  })

  #Check covariance matrix is symetric
  expect_error({
    thetahat <- c(1.1, 1.2)
    thetavar <- matrix(c(.81,.93,.16,.56), byrow = TRUE, ncol = 2)
    method   <- "log"
    check.thetas(thetavar, thetahat, method = method)
  })
  
  #Check covariance matrix is square matrix
  
  expect_error({
    thetahat <- c(1.1, 1.2)
    thetavar <- matrix(c(.81,.93,.16,.56, .15, .3), byrow = TRUE, ncol = 2)
    method   <- "log"
    check.thetas(thetavar, thetahat, method = method)
  })
  
  #Check result is true when everything is specified correctly
  
  expect_true({
    thetahat <- 0.2
    thetavar <- 0.005
    thetalow <- .17
    thetaup  <- .24
    method   <- "one2one"
    check.thetas(thetavar, thetahat, thetalow, thetaup, method = method)
  })
  
  expect_true({
    thetahat <- c(0.2, 1)
    thetalow <- c(0.17, 0.92)
    thetaup  <- c(.24, 1.16)
    method   <- "one2one"
    check.thetas(thetavar, thetahat, thetalow, thetaup, method = method)
  })
  
  
  expect_true({
    thetavar <- matrix(c(.81,.11,.11,.56), byrow = TRUE, ncol = 2)
    thetahat <- c(1, 1.2)
    method   <- "log"
    check.thetas(thetavar, thetahat, method = method)
  })
  
  expect_true({
    thetavar <- 0.01
    thetahat <- 0.8
    method   <- "log"
    check.thetas(thetavar, thetahat, method = method)
  })
  
  
})
