library(languageR)


### Name: splitplot
### Title: Simulated data set with split plot design
### Aliases: splitplot
### Keywords: datasets

### ** Examples
## Not run: 
##D data(splitplot)
##D table(splitplot$list, splitplot$subjects)
##D dat=splitplot
##D require(lme4)
##D require(optimx)
##D require(lmerTest)
##D dat.lmer1 = lmer(RT ~ list*priming+(1+priming|subjects)+(1+list|items),data=dat,
##D   control=lmerControl(optimizer="optimx",optCtrl=list(method="nlminb")))
##D dat.lmer2 = lmer(RT ~ list*priming+(1+priming|subjects)+(1|items),data=dat,
##D   control=lmerControl(optimizer="optimx",optCtrl=list(method="nlminb")))
##D dat.lmer3 = lmer(RT ~ list*priming+(1|subjects)+(1|items),data=dat,
##D   control=lmerControl(optimizer="optimx",optCtrl=list(method="nlminb")))
##D dat.lmer4 = lmer(RT ~ list*priming+(1|subjects),data=dat,
##D   control=lmerControl(optimizer="optimx",optCtrl=list(method="nlminb")))
##D anova(dat.lmer1, dat.lmer2, dat.lmer3, dat.lmer4)
##D summary(dat.lmer3)
## End(Not run)


