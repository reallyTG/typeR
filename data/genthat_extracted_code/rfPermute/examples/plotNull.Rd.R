library(rfPermute)


### Name: plotNull
### Title: Plot Random Forest Importance Null Distributions
### Aliases: plotNull

### ** Examples

# A regression model using the ozone example
data(airquality)
ozone.rfP <- rfPermute(
  Ozone ~ ., data = airquality, ntree = 100, 
  na.action = na.omit, nrep = 50, num.cores = 1
)
  
# Plot the null distributions and observed values.
plotNull(ozone.rfP) 




