library(SurvRegCensCov)


### Name: WeibullDiag
### Title: Diagnostic Plot of Adequacy of Weibull Distribution
### Aliases: WeibullDiag
### Keywords: survival regression

### ** Examples

data(larynx)
WeibullDiag(Surv(time, death) ~ stage, data = larynx)



