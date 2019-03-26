library(lavaan.survey)


### Name: lavaan.survey
### Title: Complex survey analysis of structural equation models (SEM)
### Aliases: lavaan.survey
### Keywords: survey models regression robust multivariate

### ** Examples

###### A single group example #######

# European Social Survey Denmark data (SRS)
data(ess.dk)

# A saturated model with reciprocal effects from Saris & Gallhofer
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



###### A multiple group example #######

data(HolzingerSwineford1939)

# The Holzinger and Swineford (1939) example - some model with complex restrictions
HS.model <- ' visual  =~ x1 + x2 + c(lam31, lam31)*x3
              textual =~ x4 + x5 + c(lam62, lam62)*x6
              speed   =~ x7 + x8 + c(lam93, lam93)*x9 
             speed ~ textual 
             textual ~ visual'

# Fit multiple group per school
fit <- lavaan(HS.model, data=HolzingerSwineford1939,
              int.ov.free=TRUE, meanstructure=TRUE,
              auto.var=TRUE, auto.fix.first=TRUE, group="school",
              auto.cov.lv.x=TRUE, estimator="MLM")
summary(fit, fit.measures=TRUE)

# Create fictional clusters in the HS data
set.seed(20121025)
HolzingerSwineford1939$clus <- sample(1:100, size=nrow(HolzingerSwineford1939), replace=TRUE)
survey.design <- svydesign(ids=~clus, prob=~1, data=HolzingerSwineford1939)

summary(fit.survey <- lavaan.survey(fit, survey.design))


# For more examples, please see the Journal of Statistical Software Paper, 
#  the accompanying datasets ?cardinale ?ess4.gb ?liss ?pisa.be.2003
#  and my homepage http://daob.nl/ 




