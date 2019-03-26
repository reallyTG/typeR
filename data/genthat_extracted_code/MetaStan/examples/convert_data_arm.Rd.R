library(MetaStan)


### Name: convert_data_arm
### Title: Convert contrast-based dataset to arm-based dataset
### Aliases: convert_data_arm

### ** Examples

data('dat.Crins2014', package = "MetaStan")
## Subset of dataset where PTLD outcomes available
dat.Crins2014.PTLD = subset(dat.Crins2014, is.finite(exp.PTLD.events))
## Create arm-based dataset
dat.Crins2014.PTLD.arm <- convert_data_arm(dat.Crins2014.PTLD$exp.total,
dat.Crins2014.PTLD$cont.total,dat.Crins2014.PTLD$exp.PTLD.events,
dat.Crins2014.PTLD$cont.PTLD.events)
## No test: 
glmer(cbind(r, sampleSize - r) ~ factor(mu) + factor(theta) + (theta12 - 1|mu),
data = dat.Crins2014.PTLD.long, family = binomial(link = "logit"), nAGQ = 7)
## End(No test)





