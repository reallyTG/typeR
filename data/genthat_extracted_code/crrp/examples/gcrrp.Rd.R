library(crrp)


### Name: gcrrp
### Title: Group penalized variable selection in competing risks regression
### Aliases: gcrrp
### Keywords: survival

### ** Examples

  set.seed(10)
  ftime <- rexp(200)
  fstatus <- sample(0:2,200,replace=TRUE)
  cov <- matrix(runif(2000),nrow=200)
  dimnames(cov)[[2]] <- paste("x", 1:ncol(cov))
  group <- c(1,1,2,2,2,3,4,4,5,5)
  #fit gSCAD penalty
  fit1 <- gcrrp(ftime, fstatus, cov, group=group, penalty="gSCAD")
  beta1 <- fit1$beta[, which.min(fit1$BIC)]
  #fit adaptive gLASSO
  fit2 <- gcrrp(ftime, fstatus, cov, group=group, penalty="gLASSO", weighted=TRUE)
  beta2 <- fit2$beta[, which.min(fit2$BIC)]



