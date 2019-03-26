library(driftR)


### Name: dr_correctOne
### Title: One-point drift correction
### Aliases: dr_correctOne

### ** Examples

testData <- data.frame(
   Date = c("9/18/2015", "9/18/2015", "9/18/2015", "9/18/2015", "9/18/2015", "9/18/2015"),
   Time = c("12:10:49", "12:15:50", "12:20:51", "12:25:51", "12:30:51", "12:35:51"),
   Temp = c(14.76, 14.64, 14.57, 14.51, 14.50, 14.63),
   SpCond = c(0.754, 0.750, 0.750, 0.749, 0.749, 0.749),
   corrFac = c(0.0000000, 0.2003995, 0.4007989, 0.6005326, 0.8002663, 1.0000000),
   stringsAsFactors = FALSE
 )

dr_correctOne(testData, sourceVar = SpCond, cleanVar = SpCond_Corr,
    calVal = 1.05, calStd = 1, factorVar = corrFac)




