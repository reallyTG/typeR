library(mice)


### Name: getfit
### Title: Extract list of fitted model
### Aliases: getfit
### Keywords: manip

### ** Examples


imp <- mice(nhanes)
fit <- with(imp, lm(bmi~chl+hyp))
getfit(fit)
getfit(fit, 2)




