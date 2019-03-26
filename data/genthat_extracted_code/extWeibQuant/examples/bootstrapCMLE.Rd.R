library(extWeibQuant)


### Name: bootstrapCMLE
### Title: Bootstrap Censored Weibull MLE for censoring threshold selection
###   and standard error of the quantile estimates
### Aliases: bootstrapCMLE
### Keywords: Bootstrap Threshold selection Weibull Censor

### ** Examples

set.seed(1)
y <- sort(rweibull(100, 7, 7))
tlist <- bootstrapCMLE(y, B=1000, canSet=c(0.1, 0.5, 1), randSeed=1)
tlist$results #Usually, we only need to look at the results part.



