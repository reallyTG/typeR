library(languageR)


### Name: lexdec
### Title: Lexical decision latencies for 79 English nouns
### Aliases: lexdec
### Keywords: datasets

### ** Examples
## Not run: 
##D data(lexdec)
##D require(lme4)
##D require(lmerTest)
##D require(optimx)
##D 
##D lexdec.lmer = lmer(RT ~ 1 + Correct + Trial + PrevType * meanWeight + 
##D   Frequency + NativeLanguage * Length + (1|Subject) + (1|Word), 
##D   control=lmerControl(optimizer="optimx",optCtrl=list(method="nlminb")),
##D   data = lexdec)
##D summary(lexdec.lmer)
##D 
##D # random slopes
##D 
##D lexdec.lmerA = lmer(RT ~ 1 + Correct + Trial + PrevType * meanWeight + 
##D   Frequency + NativeLanguage * Length + (Trial|Subject) + (1|Word), 
##D   control=lmerControl(optimizer="optimx",optCtrl=list(method="nlminb")),
##D   data = lexdec)
##D anova(lexdec.lmer, lexdec.lmerA)
##D 
##D lexdec.lmerB = lmer(RT ~ 1 + Correct + Trial + PrevType * meanWeight + 
##D   Frequency + NativeLanguage * Length + (Trial|Subject) + 
##D   (Length|Subject) + (1|Word), data = lexdec,
##D   control=lmerControl(optimizer="optimx",optCtrl=list(method="nlminb")))
##D anova(lexdec.lmerA, lexdec.lmerB)
##D 
##D # model criticism
##D 
##D qqnorm(resid(lexdec.lmerB))
##D 
##D lexdec.lmerC = lmer(RT ~ 1 + Correct + Trial + PrevType * meanWeight + 
##D   Frequency + NativeLanguage * Length + 
##D   (Trial|Subject) + (Length|Subject) + (1|Word), 
##D   data = lexdec[abs(scale(resid(lexdec.lmerB)))<2,],
##D   control=lmerControl(optimizer="optimx",optCtrl=list(method="nlminb")))
##D 
##D qqnorm(resid(lexdec.lmerC))
##D 
##D # p values
##D summary(lexdec.lmerC)
##D 
## End(Not run)


