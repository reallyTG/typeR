library(Hmisc)


### Name: bootkm
### Title: Bootstrap Kaplan-Meier Estimates
### Aliases: bootkm
### Keywords: survival nonparametric

### ** Examples

# Compute 0.95 nonparametric confidence interval for the difference in
# median survival time between females and males (two-sample problem)
set.seed(1)
library(survival)
S <- Surv(runif(200))      # no censoring
sex <- c(rep('female',100),rep('male',100))
med.female <- bootkm(S[sex=='female',], B=100) # normally B=500
med.male   <- bootkm(S[sex=='male',],   B=100)
describe(med.female-med.male)
quantile(med.female-med.male, c(.025,.975), na.rm=TRUE)
# na.rm needed because some bootstrap estimates of median survival
# time may be missing when a bootstrap sample did not include the
# longer survival times



