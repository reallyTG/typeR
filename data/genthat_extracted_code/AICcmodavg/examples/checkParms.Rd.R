library(AICcmodavg)


### Name: checkParms
### Title: Identify Parameters with Large Standard Errors
### Aliases: checkParms checkParms.default checkParms.betareg
###   checkParms.clm checkParms.clmm checkParms.coxme checkParms.coxph
###   checkParms.glm checkParms.gls checkParms.gnls checkParms.hurdle
###   checkParms.lm checkParms.lme checkParms.lmekin checkParms.maxlikeFit
###   checkParms.merMod checkParms.multinom checkParms.nlme checkParms.nls
###   checkParms.polr checkParms.rlm checkParms.survreg
###   checkParms.unmarkedFit checkParms.vglm checkParms.zeroinfl
###   print.checkParms
### Keywords: models

### ** Examples

##example with multiple-season occupancy model modified from ?colext
## Not run: 
##D require(unmarked)
##D data(frogs)
##D umf <- formatMult(masspcru)
##D obsCovs(umf) <- scale(obsCovs(umf))
##D siteCovs(umf) <- rnorm(numSites(umf))
##D yearlySiteCovs(umf) <- data.frame(year = factor(rep(1:7,
##D                                     numSites(umf))))
##D 
##D ##model with with year-dependent transition rates
##D fm.yearly <- colext(psiformula = ~ 1, gammaformula = ~ year,
##D                     epsilonformula = ~ year,
##D                     pformula = ~ JulianDate + I(JulianDate^2),
##D                     data = umf)
##D 
##D ##check for high SE's and report highest
##D ##across all parameter types
##D checkParms(fm.yearly, simplify = TRUE)
##D 
##D ##check for high SE's and report highest
##D ##for each parameter type
##D checkParms(fm.yearly, simplify = FALSE)
##D detach(package:unmarked)
## End(Not run)

##example from Agresti 2002 of logistic regression
##with parameters estimated at the boundary (complete separation)
## Not run: 
##D x <- c(10, 20, 30, 40, 60, 70, 80, 90)
##D y <- c(0, 0, 0, 0, 1, 1, 1, 1)
##D 
##D m1 <- glm(y ~ x, family = binomial)
##D checkParms(m1)
## End(Not run)



