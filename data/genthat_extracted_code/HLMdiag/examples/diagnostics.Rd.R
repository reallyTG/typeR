library(HLMdiag)


### Name: diagnostics
### Title: Calculating influence diagnostics for HLMs.
### Aliases: cooks.distance.case_delete covratio.case_delete
###   covtrace.case_delete diagnostics mdffits.case_delete rvc.case_delete
### Keywords: models regression

### ** Examples

library(lme4)
fm <- lmer(Reaction ~ Days + (Days | Subject), sleepstudy)

# Subject level deletion and diagnostics
subject.del  <- case_delete(model = fm, group = "Subject", type = "both")
subject.diag <- diagnostics(subject.del)



