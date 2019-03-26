library(languageR)


### Name: pvals.fnc
### Title: Compute p-values and MCMC confidence intervals for mixed models
### Aliases: pvals.fnc
### Keywords: regression

### ** Examples

  ## Not run: 
##D   data(primingHeid) 
##D   library(lme4)
##D 
##D   # remove extreme outliers
##D   primingHeid = primingHeid[primingHeid$RT < 7.1,]
##D 
##D   # fit mixed-effects model
##D 
##D   # we will stay as close to the older optimizer of lme4 as possible -
##D   # this requires the optimx package and using the control option of lmer()
##D 
##D   require(optimx)
##D   require(lmerTest)
##D 
##D   primingHeid.lmer = lmer(RT ~ RTtoPrime * ResponseToPrime + 
##D     Condition + (1|Subject) + (1|Word), data = primingHeid,
##D     control=lmerControl(optimizer="optimx",optCtrl=list(method="nlminb")))
##D   summary(primingHeid.lmer)
##D   anova(primingHeid.lmer)
##D   
## End(Not run)



