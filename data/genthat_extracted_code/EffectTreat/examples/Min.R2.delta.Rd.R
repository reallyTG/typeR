library(EffectTreat)


### Name: Min.R2.delta
### Title: Compute minimum R^2_{delta} for desired prediction accuracy
### Aliases: Min.R2.delta
### Keywords: Prediction accuracy Continuous-continuous setting
###   Multivariate setting

### ** Examples

Fit <- Min.R2.delta(delta = seq(from = 0, to = 250, by=50), 
  Sigma_T0T0 = 38.606, Sigma_T1T1 = 663.917)

# Explore the results
summary(Fit)
plot(Fit)



