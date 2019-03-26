library(pbkrtest)


### Name: kr-vcov
### Title: Ajusted covariance matrix for linear mixed models according to
###   Kenward and Roger
### Aliases: LMM_Sigma_G get_SigmaG get_SigmaG.lmerMod get_SigmaG.mer
###   kr-vcov vcovAdj vcovAdj.lmerMod vcovAdj.mer vcovAdj0 vcovAdj2
###   vcovAdj_internal
### Keywords: inference models

### ** Examples


fm1 <- lmer(Reaction ~ Days + (Days|Subject), sleepstudy)

## Here the adjusted and unadjusted covariance matrices are identical,
## but that is not generally the case
v1 <- vcov(fm1)
v2 <- vcovAdj(fm1,detail=0)
v2 / v1

## For comparison, an alternative estimate of the variance-covariance
## matrix is based on parametric bootstrap (and this is easily
## parallelized): 

## Not run: 
##D nsim <- 100
##D sim <- simulate(fm.ml, nsim)
##D B <- lapply(sim, function(newy) try(fixef(refit(fm.ml, newresp=newy))))
##D B <- do.call(rbind, B)
##D v3 <- cov.wt(B)$cov
##D v2/v1
##D v3/v1
## End(Not run)






