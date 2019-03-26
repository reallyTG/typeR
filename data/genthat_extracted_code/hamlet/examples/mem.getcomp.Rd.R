library(hamlet)


### Name: mem.getcomp
### Title: Extract per-observation components for fixed and random effects
###   of a mixed-effects model
### Aliases: mem.getcomp
### Keywords: regression

### ** Examples

data(vcaplong)

exdat <- vcaplong[vcaplong[,"Group"] %in% c("Vehicle", "ARN"),]

library(lme4)
f1 <- lmer(log2PSA ~ 1 + DrugWeek + DrugWeek:ARN + (1 + DrugWeek|ID), data = exdat)

mem.getcomp(f1)



