library(languageR)


### Name: aovlmer.fnc
### Title: Compute p-values for factors in mixed models
### Aliases: aovlmer.fnc
### Keywords: regression

### ** Examples

  ## Not run: 
##D   library(optimx)
##D   library(lme4)
##D   data(latinsquare)
##D   l.lmer = lmer(RT~SOA+(1|Word)+(1|Subject), data=latinsquare,
##D     control=lmerControl(optimizer="optimx",optCtrl=list(method="nlminb")))
##D   library(lmerTest)
##D   summary(l.lmer)
##D   anova(l.lmer)
##D   
## End(Not run)



