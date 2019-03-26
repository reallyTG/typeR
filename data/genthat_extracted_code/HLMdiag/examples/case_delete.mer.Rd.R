library(HLMdiag)


### Name: case_delete.default
### Title: Case Deletion for 'mer'/'lmerMod' objects
### Aliases: case_delete case_delete.default case_delete.lmerMod
###   case_delete.mer
### Keywords: models regression

### ** Examples

library(lme4)
data(sleepstudy, package = 'lme4')
fm <- lmer(Reaction ~ Days + (Days|Subject), sleepstudy)

# Deleting every Subject
fmDel <- case_delete(model = fm, group = "Subject", type = "both")

# Deleting only subject 308
del308 <- case_delete(model = fm, group = "Subject", type = "both", delete = 308)

# Deleting a subset of subjects
delSubset <- case_delete(model = fm, group = "Subject", type = "both", delete = 308:310)



