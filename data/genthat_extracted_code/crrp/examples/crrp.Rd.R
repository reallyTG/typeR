library(crrp)


### Name: crrp
### Title: Penalized variable selection at the individual level in
###   competing risks regression
### Aliases: crrp
### Keywords: survival

### ** Examples

  #simulate competing risks data
  set.seed(10)
  ftime <- rexp(200)
  fstatus <- sample(0:2,200,replace=TRUE)
  cov <- matrix(runif(1000),nrow=200)
  dimnames(cov)[[2]] <- c('x1','x2','x3','x4','x5')
  
  #fit LASSO
  fit <- crrp(ftime, fstatus, cov, penalty="LASSO")
  #use BIC to select tuning parameters
  beta <- fit$beta[, which.min(fit$BIC)]
  beta.se <- fit$SE[, which.min(fit$BIC)]
  
  #fit adaptive LASSO
  weight <- 1/abs(crr(ftime, fstatus, cov)$coef)
  fit2 <-crrp(ftime, fstatus, cov, penalty="LASSO", penalty.factor=weight, weighted=TRUE)
  beta2 <- fit2$beta[, which.min(fit2$BIC)]
  beta2.se <- fit2$SE[, which.min(fit2$BIC)]
  



