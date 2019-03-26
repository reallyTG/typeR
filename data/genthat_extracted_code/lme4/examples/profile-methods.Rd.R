library(lme4)


### Name: profile-methods
### Title: Profile method for merMod objects
### Aliases: as.data.frame.thpr log.thpr logProf varianceProf
###   profile-methods profile.merMod
### Keywords: methods

### ** Examples

fm01ML <- lmer(Yield ~ 1|Batch, Dyestuff, REML = FALSE)
system.time(
  tpr  <- profile(fm01ML, optimizer="Nelder_Mead", which="beta_")
)## fast; as only *one* beta parameter is profiled over
## full profiling (default which means 'all) needs
## ~2.6s (on a 2010 Macbook Pro)
system.time( tpr  <- profile(fm01ML))
## ~1s, + possible warning about bobyqa convergence
(confint(tpr) -> CIpr)
## No test: 
stopifnot(all.equal(unname(CIpr),
  array(c(12.1985292, 38.2299848, 1486.4515,
          84.0630513, 67.6576964, 1568.54849), dim = 3:2),
                    tol= 1e-07))# 1.37e-9 {64b}
## End(No test)
library("lattice")
xyplot(tpr)
xyplot(tpr, absVal=TRUE) # easier to see conf.int.s (and check symmetry)
xyplot(tpr, conf = c(0.95, 0.99), # (instead of all five 50, 80,...)
       main = "95% and 99% profile() intervals")
xyplot(logProf(tpr, ranef=FALSE),
       main = expression("lmer profile()s"~~ log(sigma)*" (only log)"))
densityplot(tpr, main="densityplot( profile(lmer(..)) )")
densityplot(varianceProf(tpr), main=" varianceProf( profile(lmer(..)) )")
splom(tpr)
splom(logProf(tpr, ranef=FALSE))
doMore <- lme4:::testLevel() > 1 
if(doMore) { ## not typically, for time constraint reasons
 ## Batch and residual variance only
 system.time(tpr2 <- profile(fm01ML, which=1:2, optimizer="Nelder_Mead"))
 print( xyplot(tpr2) )
 print( xyplot(log(tpr2)) )# log(sigma) is better
 print( xyplot(logProf(tpr2, ranef=FALSE)) )

 ## GLMM example
 gm1 <- glmer(cbind(incidence, size - incidence) ~ period + (1 | herd),
	     data = cbpp, family = binomial)
 ## running ~ 10-12 seconds on a modern machine {-> "verbose" while you wait}:
 print( system.time(pr4 <- profile(gm1, verbose=TRUE)) )
 print( xyplot(pr4, layout=c(5,1), as.table=TRUE) )
 print( xyplot(log(pr4), absVal=TRUE) ) # log(sigma_1)
 print( splom(pr4) )
 print( system.time( # quicker: only sig01 and one fixed effect
     pr2 <- profile(gm1, which=c("theta_", "period2"))))
 print( confint(pr2) )
 ## delta..: higher underlying resolution, only for 'sigma_1':
 print( system.time(
     pr4.hr <- profile(gm1, which="theta_", delta.cutoff=1/16)))
 print( xyplot(pr4.hr) )
}



