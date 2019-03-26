library(climextRemes)


### Name: calc_riskRatio_binom
### Title: Compute risk ratio and uncertainty based on binomial models for
###   counts of events relative to possible number of events
### Aliases: calc_riskRatio_binom

### ** Examples

# risk ratio for 40/400 compared to 8/400 events and for
# 4/100 compared to 0/100 events
calc_riskRatio_binom(c(40, 8), c(400, 400), ciType = c('lrt', 'boot_stud', 'koopman'))
# LRT and Koopman methods can estimate lower confidence interval endpoint
# even if estimated risk ratio is infinity:
calc_riskRatio_binom(c(4,0), c(100, 100), ciType = c('lrt', 'boot_stud', 'koopman'))



