library(shotGroups)


### Name: efficiency
### Title: Estimate number of required groups for given CI level and width
### Aliases: efficiency

### ** Examples

# get required number of shots to achieve 90% CI with
# a CI width of 20% of the mean (10% on either side)
# using 10 shots per group and measuring extreme spread
efficiency(n=10, CIlevel=0.9, CIwidth=0.2, stat="ES")

# as above, but using Rayleigh sigma
efficiency(n=10, CIlevel=0.9, CIwidth=0.2, stat="Rayleigh")

# check that the result for ES is about right
# -> 5% quantile with 10 groups is about 10% below the mean
# -> 95% quantile with 10 groups is about 10% above the mean
with(subset(DFdistr, (n == 10L) & (nGroups == 10L)),
     c(ES_Q050/ES_M, ES_Q950/ES_M))

# get achievable 90% CI width with 10 groups of 5 shots each
# using extreme spread
efficiency(n=5, nGroups=10, CIlevel=0.9, stat="ES")



