context("gumbel")

test_that("gumbel family behaves as it should", {
  skip_on_cran()
  library(ismev)
  library(survival)
  
  set.seed(180717)
  
  gdat <- gumbel$rng(5000,param=matrix(c(10,0.5),ncol=2), model=NULL)
  fit1 <- evm(gdat,family=gumbel,cov="numeric")
  fit2 <- evm(gdat,family=gumbel)
  fit3 <- gum.fit(gdat,show=FALSE)
  fit3$mle[2] <- log(fit3$mle[2])
  names(fit3$mle) <- names(coef(fit1))
  
  # check coefficients match  
  expect_equal(coef(fit1), fit3$mle, tol=0.001, label="gumbel: matches survival package estimation")
  expect_equal(coef(fit2), fit3$mle, tol=0.001, label="gumbel: matches survival package estimation")
  
  # check numerical cov matrix  agrees with observed info
  expect_equal(fit1$cov, fit2$cov, tol=.0001, label="gumbel: covariance matrix estimation")

  # with covariates:
  x <- rep(1:2,each=50)
  gdat <- gumbel$rng(100,param=cbind(3*x,rep(0.5,100)), model=NULL)
  df <- data.frame(x=x,y=gdat)
  fit1 <- evm(data=df,y=y,mu=~x,family=gumbel,cov="numeric")
  fit2 <- evm(data=df,y=y,mu=~x,family=gumbel)
  fit3 <- gum.fit(xdat=gdat, ydat=df, mul=1, show=FALSE)
  fit3$mle[3] <- log(fit3$mle[3])
  names(fit3$mle) <- names(coef(fit1))
  
  expect_equal(coef(fit1),fit3$mle,tol=0.01,label="gumbel: matches ismev package estimation with covariates")
  expect_equal(coef(fit2),fit3$mle,tol=0.01,label="gumbel: matches ismev package estimation with covariates")
})
