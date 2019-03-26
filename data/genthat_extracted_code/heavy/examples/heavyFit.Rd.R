library(heavy)


### Name: heavyFit
### Title: Estimation of Location and Scatter using multivariate
###   heavy-tailed distributions
### Aliases: heavyFit
### Keywords: multivariate

### ** Examples

data(creatinine)
fit <- heavyFit(~ log(WT) + log(SC) + log(140 - Age) + log(CR), data = creatinine,
  family = Student(df = 4))
summary(fit)



