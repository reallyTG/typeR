library(languageR)


### Name: make.reg.fnc
### Title: Make a simulated data set with regression design
### Aliases: make.reg.fnc
### Keywords: regression

### ** Examples
## Not run: 
##D   simdat = make.reg.fnc()
##D   require(lme4)
##D   require(lmerTest)
##D   require(optimx)
##D   simdat.lmer = lmer(RT ~ X + Y + Z + (1|Subject) + (1|Item), 
##D     control=lmerControl(optimizer="optimx",optCtrl=list(method="nlminb")),
##D     data = simdat)
##D   summary(simdat.lmer)
##D 
##D   simdat = make.reg.fnc(learn = TRUE)
##D   simdat.lmer = lmer(RT ~ X + Y + Z + Trial + (1|Subject) + (1|Item), 
##D     control=lmerControl(optimizer="optimx",optCtrl=list(method="nlminb")),
##D     data = simdat)
##D   summary(simdat.lmer)
## End(Not run)


