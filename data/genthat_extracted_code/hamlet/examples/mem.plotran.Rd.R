library(hamlet)


### Name: mem.plotran
### Title: Plot random effects histograms for a fitted mixed-effects model
### Aliases: mem.plotran
### Keywords: regression

### ** Examples

data(vcaplong)

exdat <- vcaplong[vcaplong[,"Group"] %in% c("Vehicle", "ARN"),]

library(lme4)
f1 <- lmer(log2PSA ~ 1 + DrugWeek + DrugWeek:ARN + (1 + DrugWeek|ID), data = exdat)

ranef(f1) # Histograms are plotted for these columns
mem.plotran(f1)



