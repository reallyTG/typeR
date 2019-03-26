library(robustlmm)


### Name: rlmer
### Title: Robust linear mixed models
### Aliases: lmerNoFit rlmer rlmerRcpp
### Keywords: models

### ** Examples

## dropping of VC
system.time(print(rlmer(Yield ~ (1|Batch), Dyestuff2, method="DASvar")))

## new Rcpp implementation
system.time(print(rlmerRcpp(Yield ~ (1|Batch), Dyestuff2, method="DASvar")))

## Not run: 
##D   ## Default method "DAStau"
##D   system.time(rfm.DAStau <- rlmer(Yield ~ (1|Batch), Dyestuff))
##D   summary(rfm.DAStau)
##D   ## DASvar method (faster, less accurate)
##D   system.time(rfm.DASvar <- rlmer(Yield ~ (1|Batch), Dyestuff,
##D                                   method="DASvar"))
##D   ## compare the two
##D   compare(rfm.DAStau, rfm.DASvar)
##D 
##D   ## Fit variance components with higher efficiency
##D   ## psi2propII yields squared weights to get robust estimates
##D   rlmer(diameter ~ 1 + (1|plate) + (1|sample), Penicillin,
##D         rho.sigma.e = psi2propII(smoothPsi, k = 2.28),
##D         rho.sigma.b = psi2propII(smoothPsi, k = 2.28))
##D 
##D   ## use chgDefaults for variance components including
##D   ## correlation terms (regular, non squared weights suffice)
##D   rlmer(Reaction ~ Days + (Days|Subject), sleepstudy,
##D         rho.sigma.e = psi2propII(smoothPsi, k = 2.28),
##D         rho.sigma.b = chgDefaults(smoothPsi, k = 5.11, s=10))
##D rlmer(Yield ~ (1|Batch), Dyestuff, init = lmerNoFit)
## End(Not run)



