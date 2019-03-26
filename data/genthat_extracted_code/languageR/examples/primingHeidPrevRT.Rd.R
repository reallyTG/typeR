library(languageR)


### Name: primingHeidPrevRT
### Title: Primed lexical decision latencies for neologisms ending in -heid
### Aliases: primingHeidPrevRT
### Keywords: datasets

### ** Examples
## Not run: 
##D data(primingHeidPrevRT)
##D 
##D require(lme4)
##D require(optimx)
##D require(lmerTest)
##D 
##D primingHeid.lmer = lmer(RT ~ RTtoPrime * ResponseToPrime + Condition + 
##D   log(RTmin1) + (1|Subject) + (1|Word), data = primingHeidPrevRT,
##D   control=lmerControl(optimizer="optimx",optCtrl=list(method="nlminb")))
##D summary(primingHeid.lmer)
## End(Not run)


