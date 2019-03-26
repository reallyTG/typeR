library(HLMdiag)


### Name: mdffits.default
### Title: Influence on fixed effects of HLMs
### Aliases: cooks.distance cooks.distance.lme cooks.distance.lmerMod
###   cooks.distance.mer mdffits mdffits.default mdffits.lme
###   mdffits.lmerMod mdffits.mer
### Keywords: models regression

### ** Examples

library(lme4)
data(sleepstudy, package = 'lme4')
ss <- lmer(Reaction ~ Days + (Days | Subject), sleepstudy)

# Cook's distance for individual observations
ss.cd.lev1 <- cooks.distance(ss)

# Cook's distance for each Subject
ss.cd.subject <- cooks.distance(ss, group = "Subject")

## Not run: 
##D data(Exam, package = 'mlmRev')
##D fm <- lmer(normexam ~ standLRT * schavg + (standLRT | school), Exam)
##D 
##D # Cook's distance for individual observations
##D cd.lev1 <- cooks.distance(fm)
##D 
##D # Cook's distance for each school
##D cd.school <- cooks.distance(fm, group = "school")
##D 
##D # Cook's distance when school 1 is deleted
##D cd.school1 <- cooks.distance(fm, group = "school", delete = 1)
##D 
## End(Not run)
# MDFFITS  for individual observations
ss.m1 <- mdffits(ss)

# MDFFITS for each Subject
ss.m.subject <- mdffits(ss, group = "Subject")

## Not run: 
##D 
##D # MDFFITS  for individual observations
##D m1 <- mdffits(fm)
##D 
##D # MDFFITS for each school
##D m.school <- mdffits(fm, group = "school")
## End(Not run)



