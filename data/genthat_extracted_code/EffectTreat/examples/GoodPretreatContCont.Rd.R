library(EffectTreat)


### Name: GoodPretreatContCont
### Title: Examine the plausibility of finding a good pretreatment
###   predictor in the Continuous-continuous case
### Aliases: GoodPretreatContCont
### Keywords: Plausibility of a good pretreatment predictor
###   Continuous-continuous setting

### ** Examples

# Assess the plausibility of finding a good pretreatment predictor when
# sigma_T0T0 = sigma_T1T1 = 8 and Delta = 1
MinPred <- GoodPretreatContCont(T0T0 = 8, T1T1 = 8, Delta = 1)
summary(MinPred)
plot(MinPred)



