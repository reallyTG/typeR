library(evidence)


### Name: Snoring
### Title: Data on the incidence of hypertension and three indicator
###   variables.
### Aliases: Snoring
### Keywords: datasets

### ** Examples

data(Snoring)
fit <- glm(cbind(hypert, n - hypert) ~ smoking + obese + snoring,
  family=binomial, data=Snoring)
summary(fit)



