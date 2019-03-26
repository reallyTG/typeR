library(metansue)


### Name: meta
### Title: Meta-Analysis of Studies with Non-statistically Significant
###   Unreported Effects
### Aliases: meta meta.nsue coef.meta.nsue fitted.meta.nsue print.meta.nsue
###   residuals.meta.nsue summary.meta.nsue
### Keywords: meta-analysis

### ** Examples

t <- c(3.4, NA, NA, NA, NA, 2.8, 2.1, 3.1, 2.0, 3.4)
n <- c(40, 20, 22, 24, 18, 30, 25, 30, 16, 22)
meta(smc_from_t(t, n))



