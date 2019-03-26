library(bamp)


### Name: predict_apc
### Title: Prediction for age-period-cohort models
### Aliases: predict_apc

### ** Examples

## Not run: 
##D data(apc)
##D model <- bamp(cases, population, age="rw1", period="rw1", cohort="rw1", periods_per_agegroup = 5)
##D pred <- predict_apc(model, periods=1)
##D plot(pred$pr[2,11,], main="Predicted rate per agegroup", ylab="p")
## End(Not run)



