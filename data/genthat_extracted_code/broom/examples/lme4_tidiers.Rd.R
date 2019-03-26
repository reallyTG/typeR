library(broom)


### Name: lme4_tidiers
### Title: Tidying methods for mixed effects models
### Aliases: lme4_tidiers tidy.merMod augment.merMod glance.merMod

### ** Examples


## Not run: 
##D if (require("lme4")) {
##D     # example regressions are from lme4 documentation
##D     lmm1 <- lmer(Reaction ~ Days + (Days | Subject), sleepstudy)
##D     tidy(lmm1)
##D     tidy(lmm1, effects = "fixed")
##D     tidy(lmm1, effects = "fixed", conf.int=TRUE)
##D     tidy(lmm1, effects = "fixed", conf.int=TRUE, conf.method="profile")
##D     tidy(lmm1, effects = "ran_modes", conf.int=TRUE)
##D     head(augment(lmm1, sleepstudy))
##D     glance(lmm1)
##D 
##D     glmm1 <- glmer(cbind(incidence, size - incidence) ~ period + (1 | herd),
##D                   data = cbpp, family = binomial)
##D     tidy(glmm1)
##D     tidy(glmm1, effects = "fixed")
##D     head(augment(glmm1, cbpp))
##D     glance(glmm1)
##D 
##D     startvec <- c(Asym = 200, xmid = 725, scal = 350)
##D     nm1 <- nlmer(circumference ~ SSlogis(age, Asym, xmid, scal) ~ Asym|Tree,
##D                   Orange, start = startvec)
##D     tidy(nm1)
##D     tidy(nm1, effects = "fixed")
##D     head(augment(nm1, Orange))
##D     glance(nm1)
##D }
## End(Not run)



