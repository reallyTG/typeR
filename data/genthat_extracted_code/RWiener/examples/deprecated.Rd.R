library(RWiener)


### Name: deprecated
### Title: Wiener likelihood and criterion functions (deprecated)
### Aliases: wiener_likelihood wiener_deviance wiener_aic wiener_bic
### Keywords: wiener_likelihood wiener_deviance wiener_aic wiener_bic

### ** Examples

### Example 1: Parameter estimation
## generate random data
dat <- rwiener(100,2,.3,.5,0)

## compute likelihood
wiener_likelihood(c(2,.3,.5,0), dat)

## estimate parameters with optim
onm <- optim(c(1,.1,.1,1),wiener_deviance,data=dat, method="Nelder-Mead")
est <- optim(onm$par,wiener_deviance,data=dat, method="BFGS",hessian=TRUE)
est$par # parameter estimates

## the following code needs the MASS package 
## Not run: sqrt(diag(MASS::ginv(est$hessian))) # sd for parameters

### Example 2: Simple model comparison
## compare two models with deviance
wiener_deviance(c(3,.3,.5,0), dat)
wiener_deviance(c(3,.3,.5,0.5), dat)
## log-likelihood difference
wiener_likelihood(c(3,.3,.5,0), dat)-wiener_likelihood(c(3,.3,.5,0.5), dat)

## Not run: ##D 
##D ### Example 3: likelihood-ratio test and Wald test
##D ## Suppose we have data from 2 conditions
##D dat1 <- rwiener(100,2,.3,.5,-.5)
##D dat2 <- rwiener(100,2,.3,.5,.5)
##D onm1 <- optim(c(1,.1,.1,1),wiener_deviance,data=dat1, method="Nelder-Mead")
##D est1 <- optim(onm1$par,wiener_deviance,data=dat1, method="BFGS",hessian=TRUE)
##D wiener_likelihood(est1$par,dat1)+wiener_likelihood(est1$par,dat2) # combined loglike
##D model_ll <- function(pars,delta,dat1,dat2) {
##D   wiener_likelihood(pars,dat1)+
##D     wiener_likelihood(c(pars[1:3],pars[4]+delta),dat2)
##D }
##D ## likelihood-ratio test
##D ## 0-model: delta=0; alt-model: delta=1
##D model_ll(est1$par,1,dat1,dat2)
##D ## compute likelihood ratio
##D LR <- -2*model_ll(est1$par,0,dat1,dat2)+2*model_ll(est1$par,1,dat1,dat2)
##D ## compare with critical X^2(1) quantile, alpha=0.05
##D LR > qchisq(0.95,1)
##D ## get p-value from X^2(1)
##D pchisq(LR,1, lower.tail=FALSE)
##D ## Wald-Test
##D ## estimate parameter delta and test for significance
##D onm2 <- optim(c(1,.1,.1,1),wiener_deviance,data=dat2, method="Nelder-Mead")
##D est2 <- optim(onm2$par,wiener_deviance,data=dat2, method="BFGS",hessian=TRUE)
##D delta <- est2$par[4]-est1$par[4]
##D ## the following code needs the MASS package 
##D est1.sd <- sqrt(diag(MASS::ginv(est1$hessian))) # sd for parameters
##D WT <- (est1$par[4]-(est1$par[4]+delta))/est1.sd[4]
##D ## compare with critical quantile N(0,1), alpha=0.05
##D abs(WT) > qnorm(0.975)
##D ## get p-value from N(0,1)
##D pnorm(WT)
## End(Not run)

### Example 4: Custom AIC loss function
many_drifts <- function(x,datlist) {
  l = 0
  for (c in 1:length(datlist)) {
    l = l + wiener_deviance(x[c(1,2,3,c+3)],datlist[[c]])
  }
  return(l)
}
dat1 <- rwiener(n=100, alpha=2, tau=.3, beta=.5, delta=0.5)
dat2 <- rwiener(n=100, alpha=2, tau=.3, beta=.5, delta=1)
datlist <- list(dat1,dat2)
wiener_aic(x=c(2,.3,.5,.5,1), data=datlist, loss=many_drifts)



