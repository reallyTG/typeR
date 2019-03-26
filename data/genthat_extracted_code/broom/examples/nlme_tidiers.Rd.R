library(broom)


### Name: nlme_tidiers
### Title: Tidying methods for mixed effects models
### Aliases: nlme_tidiers tidy.lme augment.lme glance.lme

### ** Examples


## Not run: 
##D if (require("nlme") & require("lme4")) {
##D     # example regressions are from lme4 documentation, but used for nlme
##D     lmm1 <- lme(Reaction ~ Days, random=~ Days|Subject, sleepstudy)
##D     tidy(lmm1)
##D     tidy(lmm1, effects = "fixed")
##D     head(augment(lmm1, sleepstudy))
##D     glance(lmm1)
##D 
##D 
##D     startvec <- c(Asym = 200, xmid = 725, scal = 350)
##D     nm1 <- nlme(circumference ~ SSlogis(age, Asym, xmid, scal),
##D                   data = Orange,
##D                   fixed = Asym + xmid + scal ~1,
##D                   random = Asym ~1,
##D                   start = startvec)
##D     tidy(nm1)
##D     tidy(nm1, effects = "fixed")
##D     head(augment(nm1, Orange))
##D     glance(nm1)
##D }
## End(Not run)




