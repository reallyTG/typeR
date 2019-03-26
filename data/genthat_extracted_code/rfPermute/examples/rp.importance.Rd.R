library(rfPermute)


### Name: rp.importance
### Title: Extract rfPermute Importance Scores and p-values.
### Aliases: rp.importance

### ** Examples

# A regression model using the ozone example
ozone.rfP <- rfPermute(
  Ozone ~ ., data = airquality, ntree = 100, 
  na.action = na.omit, nrep = 50, num.cores = 1
)
imp.unscaled <- rp.importance(ozone.rfP, scale = TRUE)
imp.unscaled
  
imp.scaled <- rp.importance(ozone.rfP, scale = TRUE)
imp.scaled




