context("General PAF confidence intervals")

test_that("Checking paf.confidence",{
  
  #Check results are the same for corresponding methods when variance of thetas is equal to zero
  #Inverse Empirical
  expect_equal({
    set.seed(76787)
    X        <- as.data.frame(rnorm(100,3,1))
    thetahat <- 0.2
    thetavar <- 0
    rr       <- function(X,theta){exp(X*theta)}
    paf.confidence(X=X, thetahat = thetahat, rr=rr, thetavar = thetavar, method = "empirical",
                   confidence_method = "inverse")
  },
  {
    paf.confidence.inverse(X=X, thetahat = thetahat, rr=rr, thetavar = thetavar,
                           method = "empirical")
  })
  
  #Inverse Approximate
  expect_equal({
    set.seed(76787)
    X        <- as.data.frame(mean(rnorm(100,3,1)))
    Xvar     <- 0.2
    thetahat <- 0.2
    thetavar <- 0
    rr       <- function(X,theta){exp(X*theta)}
    paf.confidence(X=X, thetahat = thetahat, rr=rr, thetavar = thetavar, method = "approximate",
                   confidence_method = "inverse", Xvar = Xvar)
  },
  {
    paf.confidence.inverse(X=X, thetahat = thetahat, rr=rr, thetavar = thetavar,
                           method = "approximate", Xvar = Xvar)
  })
  
  #One to one Empirical
  expect_equal({
    set.seed(76787)
    X        <- as.data.frame(rnorm(100,3,1))
    thetahat <- 0.2
    thetalow <- 0.1
    thetaup  <- 0.3
    rr       <- function(X,theta){exp(X*theta)}
    paf.confidence(X=X, thetahat = thetahat, rr = rr, thetalow = thetalow, thetaup = thetaup,
                   confidence_method = "one2one", method = "empirical")
  },
  {
    paf.confidence.one2one(X=X, thetahat = thetahat, rr=rr, thetalow = thetalow, thetaup = thetaup,
                           method = "empirical")
  })
  
  #One to one Approximate
  expect_equal({
    set.seed(76787)
    X        <- as.data.frame(mean(rnorm(100,3,1)))
    Xvar     <- 1
    thetahat <- 0.2
    thetalow <- 0.1
    thetaup  <- 0.3
    rr       <- function(X,theta){exp(X*theta)}
    paf.confidence(X=X, thetahat = thetahat, rr = rr, thetalow = thetalow, thetaup = thetaup,
                   confidence_method = "one2one", method = "approximate", Xvar = Xvar)
  },
  {
    paf.confidence.one2one(X=X, thetahat = thetahat, rr=rr, thetalow = thetalow, thetaup = thetaup,
                           method = "approximate", Xvar = Xvar)
  })
  
  
  
  
  
})