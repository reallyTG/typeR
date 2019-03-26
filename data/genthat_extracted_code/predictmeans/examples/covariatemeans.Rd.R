library(predictmeans)


### Name: covariatemeans
### Title: Predicted Means of a Linear Model with Covariate Variable(s)
### Aliases: covariatemeans

### ** Examples

  library(predictmeans)
  data(Oats, package="nlme")
  fm <- lme(yield ~ nitro*Variety, random=~1|Block/Variety, data=Oats)
# library(lme4)
# fm <- lmer(yield ~ nitro*Variety+(1|Block/Variety), data=Oats)
  covariatemeans(fm, "Variety", covariate="nitro")



