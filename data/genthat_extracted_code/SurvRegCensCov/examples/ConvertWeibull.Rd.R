library(SurvRegCensCov)


### Name: ConvertWeibull
### Title: Transformation of survreg output for the Weibull distribution
### Aliases: ConvertWeibull
### Keywords: survival regression

### ** Examples

data(larynx)
ConvertWeibull(survreg(Surv(time, death) ~ stage + age, larynx), conf.level = 0.95)



