context("plot.evmOpt")

test_that("plot.evmOpt behaves as it should", {
  skip_on_cran()
  skip_on_travis()
  par(mfrow=c(2,2))
  mod <- evm(rain, th=30, penalty="none")
  res <- plot(mod,main=paste(rep("Figure 4.5 of Coles (2001)",4),
                             c("\nProbability plot","\nQuantile Plot","\nReturn Level Plot\n(SCALE IS DAYS NOT YEARS)","\nDensity Plot")), 
              RetPeriodRange=c(3.65,365*10000))
  expect_that(res, equals(NULL), label="plot.evmOpt:GPDsuccessfulexecution")
  
  # check for very short tailed data
  set.seed(6)
  temp <- rgpd(1000,sigma=1,xi=-0.45)
  fit <- evm(temp,th=0)
  res <- plot(fit,main=c("GPD: PP","GPD: QQ","GPD: RL","GPD: Hist, Short tailed data"))
  expect_that(res, equals(NULL), label="plot.evmOpt:GPDsuccessfulexecution,shorttaileddata")
  
  # check for covariates in the model
  # GPD
  n <- 1000
  sig <- 2
  X <- data.frame(a = rnorm(n),b = runif(n,-0.3,0.3))
  Y <- rgpd(n,sig,X[,2])
  X$Y <- Y
  fit <- evm(Y,data=X,xi=~b,th=0)
  res <- plot(fit)
  expect_that(res, equals(NULL), label="plot.evmOpt:GPDwithcovariatessuccessfulexecution")
  
  #GEV 
  # no covariates
  n <- 1000
  Y <- rgev(n,1,1,-.1)
  fit <- evm(Y,family=gev)
  par(mfrow=c(2,2))
  res <- plot(fit,main="GEV no covariates, neg xi")
  expect_that(res, equals(NULL), label="plot.evmOpt:GEVnocovariates,negxisuccessfulexecution")
  
  Y <- rgev(n,1,1,.2)
  fit <- evm(Y,family=gev)
  res <- plot(fit,main="GEV no covariates, pos xi")
  expect_that(res, equals(NULL), label="plot.evmOpt:GEVnocovariates,posxisuccessfulexecution")
  
  #GEV with covariates
  X <- data.frame(a = rnorm(n),b = runif(n,-0.3,0.3),C= runif(n))
  Y <- rgev(n,X[,3],sig,X[,2])
  X$Y <- Y
  fit <- evm(Y,data=X,xi=~b,mu=~C,family=gev)
  par(mfrow=c(2,2))
  res <- plot(fit,main=rep("GEV with covariates",4))
  expect_that(res, equals(NULL), label="plot.evmOpt:GEVwithcovariatessuccessfulexecution")
  
  fit <- evm(Y,data=X,xi=~b,family=gev)
  par(mfrow=c(2,2))
  res <- plot(fit,main=rep("GEV with one covariate",4))
  expect_that(res, equals(NULL), label="plot.evmOpt:GEVwithonecovariatesuccessfulexecution")
}
)
