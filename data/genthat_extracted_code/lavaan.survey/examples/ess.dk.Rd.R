library(lavaan.survey)


### Name: ess.dk
### Title: Subset of four variables and interviewer number from the
###   European Social Survey, round 4 (2008) Danish sample.
### Aliases: ess.dk

### ** Examples

data(ess.dk)
head(ess.dk)

# A saturated model with reciprocal effects from Saris & Gallhofer (2007)
dk.model <- "
  socialTrust ~ 1 + systemTrust + fearCrime
  systemTrust ~ 1 + socialTrust + efficacy
  socialTrust ~~ systemTrust
"
lavaan.fit <- lavaan(dk.model, data=ess.dk, auto.var=TRUE, estimator="MLM")
summary(lavaan.fit)

# Create a survey design object with interviewer clustering
survey.design <- svydesign(ids=~intnum, prob=~1, data=ess.dk)

survey.fit <- lavaan.survey(lavaan.fit=lavaan.fit, survey.design=survey.design)
summary(survey.fit)



