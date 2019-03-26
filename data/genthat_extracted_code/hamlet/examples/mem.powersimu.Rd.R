library(hamlet)


### Name: mem.powersimu
### Title: Power simulations for the fixed effects of a mixed-effects model
###   through structured bootstrapping of the data and re-fitting of the
###   model
### Aliases: mem.powersimu
### Keywords: power design mem

### ** Examples

# Use the VCaP ARN data as an example
data(vcaplong)
arn <- vcaplong[vcaplong[,"Group"] == "Vehicle" | vcaplong[,"Group"] == "ARN",]

# lme4 is required for mixed-effects models
library(lme4)
# Fit an example fixed effects model
fit <- lmer(PSA ~ 1 + DrugWeek + ARN:DrugWeek + (1|ID) + (0 + DrugWeek|ID), data = arn)

# For reproducibility, set a seed
set.seed(123)
# Run a brief power analysis with only a few selected N values and a limited number of bootstrapping
# Balance strata over the ARN and non-ARN (=Vehicle) so that both contain equal count of individuals
power <- mem.powersimu(fit, N=c(3, 6, 9), boot=10, strata="ARN", plot=TRUE)
# Power curves are plotted, along with returning the power matrix at:
power

# Notice that each column corresponds to a specified fixed effects at the formula 
# "1 + DrugWeek + ARN:DrugWeek"




