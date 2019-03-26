library(glmdm)


### Name: glmdm
### Title: Generalized Linear Mixed Dirichlet Model
### Aliases: glmdm A.K.can A.K.labels.can A.n.can bb cand eta f.ratio
###   f.y.can f.y.old glmdm j K.can L.m.hat L.m.s.hat like.K.can Lms.hat M
###   m.hat m.hat.s m.hess.s m.hessian Mb mean mean.m meta mle.m mle.m.s mn
###   mult.can mult.old mult.ratio new.q nu p.A.can p.A.old p.ratio pq
###   psi.can rho Sca Sha test var.m X.betaM log ...

### ** Examples

## Not run: 
##D 
##D data(scotvote)
##D glmdm.linear.out <- glmdm(PerYesParl ~ PrivateHousingStarts + CouncilTax 
##D + Percentage5to15 + PrimaryPTRatio + PerBirthsOut + PerClaimantFemale, 
##D data=scotvote, num.reps=5000)
##D 
##D data(ssas)
##D glmdm.probit.ssas <- glmdm(scotpar2 ~ househld + rsex + rage + relgsums + ptyallgs
##D + idlosem + marrmus + ukintnat + natinnat + voiceuk3 + nhssat, data=ssas, 
##D family=binomial(link="probit"), num.reps=10000, log=TRUE)
##D 
##D data(asia)
##D glmdm.probit.asia <- glmdm(ATT ~ DEM + FED + SYS + AUT, data=asia, 
##D family=binomial(link="probit"), num.reps=10000, log=TRUE)
##D 
## End(Not run)



