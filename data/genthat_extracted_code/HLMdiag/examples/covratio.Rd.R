library(HLMdiag)


### Name: covratio.default
### Title: Influence on precision of fixed effects in HLMs
### Aliases: covratio covratio.default covratio.lme covratio.lmerMod
###   covratio.mer covtrace covtrace.default covtrace.lme covtrace.lmerMod
###   covtrace.mer
### Keywords: models regression

### ** Examples

library(lme4)
ss <- lmer(Reaction ~ Days + (Days | Subject), sleepstudy)

# covratio for individual observations
ss.cr1 <- covratio(ss)

# covratio for subject-level deletion
ss.cr2 <- covratio(ss, group = "Subject")

## Not run: 
##D ## A larger example
##D data(Exam, package = 'mlmRev')
##D fm <- lmer(normexam ~ standLRT * schavg + (standLRT | school), Exam)
##D 
##D # covratio for individual observations
##D cr1 <- covratio(fm)
##D 
##D # covratio for school-level deletion
##D cr2 <- covratio(fm, group = "school")
## End(Not run)
# covtrace for individual observations
ss.ct1 <- covtrace(ss)

# covtrace for subject-level deletion
ss.ct2 <- covtrace(ss, group = "Subject")

## Not run: 
##D ## Returning to the larger example
##D # covtrace for individual observations
##D ct1 <- covtrace(fm)
##D 
##D # covtrace for school-level deletion
##D ct2 <- covtrace(fm, group = "school")
## End(Not run)



