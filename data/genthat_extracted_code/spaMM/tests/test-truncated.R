cat("\ntest truncated families:\n")

data(scotlip)
fit1 <- glm(I(1+cases)~1,family=Tpoisson(),data=scotlip)
fit2 <- fitme(I(1+cases)~1+(1|id),family=Tpoisson(),fixed=list(lambda=1e-8),data=scotlip)
testthat::expect_equal(logLik(fit1)[[1L]],logLik(fit2)[[1L]],tol=2e-5) ## logL2 converges to logL1 as lambda -> 0 
testthat::expect_equal(attr(predict(fit2, intervals="predVar"),"intervals")[1,1],  9.753711, tol=2e-5) ## check ZT-enabled specific code of prediction intervals
simulate(fit2,nsim=3)

## check simulation and estimation:
if (spaMM.getOption("example_maxtime")>105) { ## if NOT sparse_precision
  lll <- Loaloa
  lll$ID <- seq(nrow(lll))
  lll$resp <- 1+floor(log(1+lll$npos))
  tnb <- fitme(resp~1+(1|ID), data=lll,family=Tnegbin(2))
  set.seed(123)
  bla <- simulate(tnb,nsim=50)
  ecd <- apply(bla,2L,function(newy) { cat("."); update_resp(tnb,newresp = newy)$fixef })
  # estimand is fixef(tnb) = 0.8398057
  testthat::expect_true(diff(c(mean(ecd),0.8165908))<1e-6) ## test modified in v2.4.0 and again in 2.5.34
  #plot(ecdf(ecd)) ## consistent with the fitted model from which simulations are drawn
}
