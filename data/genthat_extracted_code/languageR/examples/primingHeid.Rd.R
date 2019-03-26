library(languageR)


### Name: primingHeid
### Title: Primed lexical decision latencies for neologisms ending in -heid
### Aliases: primingHeid
### Keywords: datasets

### ** Examples
## Not run: 
##D data(primingHeid)
##D 
##D require(lme4)
##D require(lmerTest)
##D require(optimx)
##D 
##D primingHeid.lmer = lmer(RT ~ RTtoPrime * ResponseToPrime + Condition +
##D   (1|Subject) + (1|Word), 
##D   control=lmerControl(optimizer="optimx",optCtrl=list(method="nlminb")),
##D   data = primingHeid)
##D summary(primingHeid.lmer)
##D 
##D # model criticism
##D 
##D primingHeid.lmer = lmer(RT ~ RTtoPrime * ResponseToPrime + Condition +
##D   (1|Subject) + (1|Word), 
##D   control=lmerControl(optimizer="optimx",optCtrl=list(method="nlminb")),
##D   data = primingHeid[abs(scale(resid(primingHeid.lmer)))<2.5,])
##D summary(primingHeid.lmer)
## End(Not run)


