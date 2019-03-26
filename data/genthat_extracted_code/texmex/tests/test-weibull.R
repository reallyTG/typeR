context("weibull")

test_that("weibull family behaves as it should", {
  skip_on_cran()
  skip_on_travis()
  library(survival)
  
  wdat <- rweibull(5000,scale=10,shape=2)
  fit1 <- evm(wdat,th=0,family=weibull,cov="numeric")
  fit2 <- evm(wdat,th=0,family=weibull)
  fit3 <- survreg(Surv(wdat)~1,dist="weibull")
  survregCoefs <- c(fit3$coefficients,   1/fit3$scale)
  names(survregCoefs) <- names(coef(fit1))
  colnames(fit3$var) <- row.names(fit3$var) <- NULL

  # check coefficients match  
  expect_equal(coef(fit1), survregCoefs, tol=0.001, label="weibull: matches survival package estimation")
  expect_equal(coef(fit2), survregCoefs, tol=0.001, label="weibull: matches survival package estimation")
  
  # check numerical cov matrix  agrees with observed info
  expect_equal(fit1$cov, fit2$cov, tol=.0001, label="weibull: covariance matrix estimation")

  # with covariates:
  x <- rep(1:2,each=50)
  wdat <- rweibull(100,scale=3*x,shape=2)
  df <- data.frame(x=x,y=wdat)
  fit1 <- evm(data=df,y=y,phi=~x,th=0,family=weibull,cov="numeric")
  fit2 <- evm(data=df,y=y,phi=~x,th=0,family=weibull)
  fit3 <- survreg(Surv(wdat)~x,dist="weibull")	
  survregCoefs <- c(fit3$coefficients,   1/fit3$scale)
  names(survregCoefs) <- names(coef(fit1))
  
  expect_equal(coef(fit1),survregCoefs,tol=0.001,label="Weibull: matches survival package estimation with covariates")
  expect_equal(coef(fit2),survregCoefs,tol=0.001,label="Weibull: matches survival package estimation with covariates")
})
