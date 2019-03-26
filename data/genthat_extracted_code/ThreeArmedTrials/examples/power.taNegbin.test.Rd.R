library(ThreeArmedTrials)


### Name: power.taNegbin.test
### Title: Power related calcuations for three-armed clinical trials with
###   negative binomial distributed endpoints
### Aliases: power.taNegbin.test
### Keywords: NegativeBinomial power

### ** Examples

# Example for type = 'unrestricted': Calculation of n, power, and sig.level.
# Expect n=1038, power=0.8, sig.level=0.025, respectively
power.taNegbin.test(rateExp = 2, rateRef = 2, ratePla = 4, shape = 0.5, Delta = 0.8,
 sig.level = 0.025, power = 0.8, type = 'unrestricted', allocation = c(1/3, 1/3, 1/3))$n
power.taNegbin.test(rateExp = 2, rateRef = 2, ratePla = 4, shape = 0.5, Delta = 0.8,
 sig.level = 0.025, n = 1038, type = 'unrestricted', allocation = c(1/3, 1/3, 1/3))$power
power.taNegbin.test(rateExp = 2, rateRef = 2, ratePla = 4, shape = 0.5, Delta = 0.8,
 power = 0.8007362, n = 1038, type = 'unrestricted', allocation = c(1/3, 1/3, 1/3))$sig.level

# Example for type = 'restricted' calculation of n, power, and sig.level.
# Expect n=1092, power=0.8, sig.level=0.025
power.taNegbin.test(rateExp = 2, rateRef = 2, ratePla = 4, shape = 0.5, Delta = 0.8,
 sig.level = 0.025, power = 0.8, type = 'restricted', allocation = c(1/3, 1/3, 1/3))$n
power.taNegbin.test(rateExp = 2, rateRef = 2, ratePla = 4, shape = 0.5, Delta = 0.8,
 sig.level = 0.025, n = 1092, type = 'restricted', allocation = c(1/3, 1/3, 1/3))$power
power.taNegbin.test(rateExp = 2, rateRef = 2, ratePla = 4, shape = 0.5, Delta = 0.8,
 n = 1092, power = 0.8008113, type = 'restricted', allocation = c(1/3, 1/3, 1/3))$sig.level

# Example for recalculation of 'allocation' and 'n'
power.taNegbin.test(rateExp = 2, rateRef = 2, ratePla = 4, shape = 0.5, Delta = 0.8,
 n = 1001, power = 0.8, allocation = c(0.25, 0.5, 0.25))



