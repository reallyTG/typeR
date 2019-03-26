library(SurvRegCensCov)


### Name: WeibullReg
### Title: Weibull Regression for Survival Data
### Aliases: WeibullReg
### Keywords: survival regression

### ** Examples

data(larynx)
WR <- WeibullReg(Surv(time, death) ~ factor(stage) + age, data = larynx)
WR



