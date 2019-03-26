library(rfPermute)


### Name: rfPermute
### Title: Estimate Permutation p-values for Random Forest Importance
###   Metrics
### Aliases: rfPermute rfPermute.default rfPermute.formula
### Keywords: classif regression tree

### ** Examples

# A regression model using the ozone example
data(airquality)
ozone.rfP <- rfPermute(
  Ozone ~ ., data = airquality, ntree = 100, 
  na.action = na.omit, nrep = 50, num.cores = 1
)
  
# Plot the null distributions and observed values.
plotNull(ozone.rfP) 
  
# Plot the unscaled importance distributions and highlight significant predictors
plot(rp.importance(ozone.rfP, scale = FALSE))
  
# ... and the scaled measures
plot(rp.importance(ozone.rfP, scale = TRUE))




