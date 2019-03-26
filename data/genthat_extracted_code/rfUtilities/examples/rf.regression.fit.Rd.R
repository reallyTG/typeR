library(rfUtilities)


### Name: rf.regression.fit
### Title: Random Forest fit statistics
### Aliases: rf.regression.fit

### ** Examples

  library(randomForest)
  set.seed(131)
  data(airquality)
  airquality <- na.omit(airquality)
  ( rf.aq <- randomForest(airquality[,1:3], airquality[,"Ozone"]) )	
  rf.regression.fit(rf.aq)




