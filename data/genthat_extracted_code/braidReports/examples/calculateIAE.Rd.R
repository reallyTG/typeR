library(braidReports)


### Name: calculateIAE
### Title: Calculate the Index of Achievable Efficacy
### Aliases: calculateIAE
### Keywords: misc

### ** Examples

data(es8analysis)
bfit <- es8analysis$braidFit
# Modelled effect is base-10 logarithm of cell survival relative to negative controls,
# so a level of -2 reflects 99% cell killing
calculateIAE(bfit$fullpar,c(-1,-2),c(1.015*10^-6,5*10^-5))



