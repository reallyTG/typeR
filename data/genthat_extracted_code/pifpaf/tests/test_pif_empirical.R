context("Empirical Population Impact Fraction point-estimate")

test_that("Checking pif.empirical function errors",{
  
  #Check that relative risk > 0
  expect_warning({
    
    X <- data.frame(rnorm(100, 3, .7))
    thetahat <- 1.4
    pif.empirical(X, thetahat, function(X, theta){-theta*X + 1})
    
  })
  
  #Check that exposure levels are positive
  expect_warning({
    X <- data.frame(rnorm(100, -1))
    thetahat <- 1.4
    pif.empirical(X, thetahat, function(X, theta){exp(theta*X)})
    
  })
  
  #Check that counterfactual relative risk > 0
  expect_warning({
    X <- data.frame(rnorm(100, 4,1))
    thetahat <- 1.4
    pif.empirical(X, thetahat, rr = function(X, theta){X*theta + 1}, 
        cft = function(X){-100*X})
    
  })
})

test_that("Checking pif.empirical function warnings",{
  
  #Check that RR(0, theta) = 1
  expect_warning({
    
    X <- data.frame(cbind(rnorm(100, 3, .4), rbeta(100, 0.5, 0.5)))
    thetahat <- 1.4
    pif.empirical(X, thetahat, function(X, theta){X[,1]*X[,2]*theta + 2})
    
  })
  
  #Check that RR under counterfactual is smaller than RR under normal circumstances
  expect_warning({
    
    X <- data.frame(c(1,2,3))
    thetahat <- 1.4
    pif.empirical(X, thetahat, function(X, theta){X*theta + 1}, cft = function(X){100*X})
    
  })
  
})

test_that("Checking pif.empirical convergence",{
  
    #Check that empirical PAF works
    expect_equal(
      round(pif.empirical(data.frame(c(1,2,3)), 1, rr = function(X, theta){exp(theta*X)}),2),
      round(1 - 3/sum(exp(c(1,2,3))),2)
    )
    
    #Check that empirical PIF works when counterfactual is identity
    expect_equal(
      round(pif.empirical(data.frame(c(1,2,3)), 1, rr = function(X, theta){exp(theta*X)}, 
                          cft = function(X){X}),2),
      0
    )
    
    #Check that empirical PAF works when RR is constant 1
    expect_equal(
      round(pif.empirical(data.frame(c(1,2,3)), 1, rr = function(X, theta){rep(1, nrow(X))}),2),
      0
    )
    
    #Check that empirical PIF works when RR is constant 1
    expect_equal(
      round(pif.empirical(data.frame(c(1,2,3)), 1, rr = function(X, theta){rep(1, nrow(X))}, 
                          cft = function(X){(0.2*X)^2}),2),
      0
    )
    
    #Check that empirical PIF works when counterfactual is constant 0
    expect_equal(
      round(pif.empirical(data.frame(c(1,2,3)), 1, rr = function(X, theta){exp(theta*X)}, 
                          cft = function(X){rep(0, nrow(X))}),2),
      round(1 - 3/sum(exp(c(1,2,3))),2)
    )
  
})

