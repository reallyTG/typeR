library(designmatch)


### Name: absstddif
### Title: Absolute standardized differences in means.
### Aliases: absstddif

### ** Examples

# Load and attach data
data(lalonde)
attach(lalonde)

# Treatment indicator
t_ind = treatment

# Constrain differences in means to be at most .05 standard deviations apart
mom_covs = cbind(age, education, black, hispanic, married, nodegree, re74, re75)
mom_tols = absstddif(mom_covs, t_ind, .05)



