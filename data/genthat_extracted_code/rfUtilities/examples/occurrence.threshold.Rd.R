library(rfUtilities)


### Name: occurrence.threshold
### Title: Test occurrence probability thresholds
### Aliases: occurrence.threshold

### ** Examples

library(randomForest)
 data(imports85)
  imp85 <- imports85[,-2] 
  imp85 <- imp85[complete.cases(imp85), ]
  imp85[] <- lapply(imp85, function(x) if (is.factor(x)) x[, drop=TRUE] else x)

y <- ifelse( imp85$numOfDoors != "four", "0", "1")   
( rf.mdl <- randomForest(y = as.factor(y), x = imp85[,-5]) )
   ( delta.ss.t <- occurrence.threshold(rf.mdl, imp85[,-5], class = "1") )
   ( sum.ss.t <- occurrence.threshold(rf.mdl, imp85[,-5], class = "1", 
                                      type = "sum.ss") ) 
   ( kappa.ss.t <- occurrence.threshold(rf.mdl, imp85[,-5], class = "1",
                                      type = "kappa") )
  
par(mfrow=c(2,2))
  plot(sum.ss.t)
  plot(delta.ss.t)
  plot(kappa.ss.t)   
  



