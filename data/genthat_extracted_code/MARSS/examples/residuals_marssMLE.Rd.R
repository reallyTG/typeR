library(MARSS)


### Name: residuals.marssMLE
### Title: MARSS Standardized Residuals
### Aliases: residuals residuals.marssMLE residuals.MARSS residuals.marss

### ** Examples

  dat <- t(harborSeal)
  dat <- dat[c(2,11),]
  MLEobj <- MARSS(dat)
  
  #state residuals
  state.resids1 <- residuals(MLEobj)$state.residuals
  #this is the same as
  states <- MLEobj$states
  Q=coef(MLEobj,type="matrix")$Q
  state.resids2 <- states[,2:30]-states[,1:29]-matrix(coef(MLEobj,type="matrix")$U,2,29)
  #standardize to variance of 1
  state.resids2 <- (solve(t(chol(Q))) %*% state.resids2)
  #compare the two
  cbind(t(state.resids1[,-30]),t(state.resids2))

  #standardized (by variance) model & state residuals
  residuals(MLEobj)$std.residuals



