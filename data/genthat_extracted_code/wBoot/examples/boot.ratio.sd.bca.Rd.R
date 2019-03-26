library(wBoot)


### Name: boot.ratio.sd.bca
### Title: BCa Bootstrap Independent-Samples Test and CI for Two Standard
###   Deviations
### Aliases: boot.ratio.sd.bca

### ** Examples

# Elmendorf tear strengths, in grams, for independent samples of
# Brand A and Brand B vinyl floor coverings.
data("elmendorf")
str(elmendorf)
attach(elmendorf)
# Note that the data are stacked.

# 90% confidence interval for the ratio of the population standard
# deviations of tear strength for Brands A and B.
boot.ratio.sd.bca(STRENGTH, BRAND, conf.level = 0.90)

# 95% (default) confidence interval for the ratio of the population
# standard deviations of tear strength for Brands A and B, and a
# two-tailed hypothesis test with null hypothesis 1 (i.e., the
# population standard deviations are equal).
boot.ratio.sd.bca(STRENGTH, BRAND, null.hyp = 1)

detach(elmendorf)  # clean up



