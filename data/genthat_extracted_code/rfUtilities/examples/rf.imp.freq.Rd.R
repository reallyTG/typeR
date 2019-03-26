library(rfUtilities)


### Name: rf.imp.freq
### Title: Random Forest variable selection frequency
### Aliases: rf.imp.freq

### ** Examples

 
 require(randomForest)
 data(iris)
 iris.rf <- randomForest(Species ~ ., data=iris, importance=TRUE)
 rf.imp.freq(iris.rf, p = 0.30)




