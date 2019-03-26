library(rfPermute)


### Name: plot.rp.importance
### Title: Plot Random Forest Importance Distributions
### Aliases: plot.rp.importance

### ** Examples

# A regression model using the ozone example
data(airquality)
ozone.rfP <- rfPermute(
  Ozone ~ ., data = airquality, ntree = 100, 
  na.action = na.omit, nrep = 50, num.cores = 1
)
  
# Plot the unscaled importance distributions and highlight significant predictors
plot(rp.importance(ozone.rfP, scale = FALSE))
  
# ... and the scaled measures
plot(rp.importance(ozone.rfP, scale = TRUE))




