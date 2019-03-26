library(mice)


### Name: lm.mids
### Title: Linear regression for 'mids' object
### Aliases: lm.mids
### Keywords: multivariate

### ** Examples



imp <- mice(nhanes)
fit <- lm.mids(bmi~hyp+chl, data = imp)
fit




