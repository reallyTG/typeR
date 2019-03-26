library(glmmTMB)


### Name: VarCorr.glmmTMB
### Title: Extract variance and correlation components
### Aliases: VarCorr.glmmTMB VarCorr
### Keywords: internal

### ** Examples

## Comparing variance-covariance matrix with manual computation
data("sleepstudy",package="lme4")
fm4 <- glmmTMB(Reaction ~ Days + (Days|Subject), sleepstudy)
VarCorr(fm4)[[c("cond","Subject")]]
## hand calculation
pars <- getME(fm4,"theta")
## construct cholesky factor
L <- diag(2)
L[lower.tri(L)] <- pars[-(1:2)]
C <- crossprod(L)
diag(C) <- 1
sdvec <- exp(pars[1:2])
(V <- outer(sdvec,sdvec) * C)



