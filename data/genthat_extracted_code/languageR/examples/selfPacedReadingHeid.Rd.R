library(languageR)


### Name: selfPacedReadingHeid
### Title: Self-paced reading latencies for Dutch neologisms
### Aliases: selfPacedReadingHeid
### Keywords: datasets

### ** Examples
## Not run: 
##D data(selfPacedReadingHeid)
##D 
##D # data validation
##D plot(sort(selfPacedReadingHeid$RT))   
##D selfPacedReadingHeid = selfPacedReadingHeid[selfPacedReadingHeid$RT > 5 & 
##D   selfPacedReadingHeid$RT < 7.2,]
##D 
##D # fitting a mixed-effects model
##D 
##D require(lme4)
##D require(lmerTest)
##D require(optimx)
##D x = selfPacedReadingHeid[,12:15]
##D x.pr = prcomp(x, center = TRUE, scale = TRUE)
##D selfPacedReadingHeid$PC1 = x.pr$x[,1]
##D 
##D selfPacedReadingHeid.lmer = lmer(RT ~ RTtoPrime + LengthInLetters + 
##D   PC1 * Condition + (1|Subject) + (1|Word), 
##D   control=lmerControl(optimizer="optimx",optCtrl=list(method="nlminb")),
##D   data = selfPacedReadingHeid)  
##D summary(selfPacedReadingHeid.lmer)
##D 
##D # model criticism
##D 
##D selfPacedReadingHeid.lmerA = lmer(RT ~ RTtoPrime + LengthInLetters + 
##D   PC1 * Condition + (1|Subject) + (1|Word), 
##D   control=lmerControl(optimizer="optimx",optCtrl=list(method="nlminb")),
##D   data = selfPacedReadingHeid[abs(scale(resid(selfPacedReadingHeid.lmer))) < 2.5, ])
##D 
##D qqnorm(resid(selfPacedReadingHeid.lmerA))
##D summary(selfPacedReadingHeid.lmerA)
## End(Not run)


