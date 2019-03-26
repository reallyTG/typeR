library(rfUtilities)


### Name: rf.partial.ci
### Title: Random Forests regression partial dependency plot with
###   confidence intervals
### Aliases: rf.partial.ci

### ** Examples

 library(randomForest)
 data(airquality)
 airquality <- na.omit(airquality)
 rf.ozone <- randomForest(y=airquality[,"Ozone"], airquality[,2:ncol(airquality)])

 par(mfrow=c(2,2))
   for(i in c("Solar.R", "Wind", "Temp", "Day")){
     rf.partial.ci(m=rf.ozone, x=airquality, yname="Ozone", xname=i, delta=TRUE) 
   } 




