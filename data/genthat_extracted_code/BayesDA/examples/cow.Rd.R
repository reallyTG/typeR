library(BayesDA)


### Name: cow
### Title: Data from an Experiment with Treatment Assignment Based on
###   Covariates
### Aliases: cow
### Keywords: datasets

### ** Examples

data(cow)
summary(cow)
names(cow)
# Investigating balance on pretreatment variables:
with(cow, tapply(lactation, level, mean))
with(cow, tapply(age, level, mean))



