library(driftR)


### Name: dr_factor
### Title: Creating correction factors
### Aliases: dr_factor

### ** Examples

testData <- data.frame(
   Date = c("9/18/2015", "9/18/2015", "9/18/2015", "9/18/2015", "9/18/2015", "9/18/2015"),
   Time = c("12:10:49", "12:15:50", "12:20:51", "12:25:51", "12:30:51", "12:35:51"),
   Temp = c(14.76, 14.64, 14.57, 14.51, 14.50, 14.63),
   SpCond = c(0.754, 0.750, 0.750, 0.749, 0.749, 0.749),
   stringsAsFactors = FALSE
 )

dr_factor(testData, corrFactor = corrFac, dateVar = Date, timeVar = Time, keepDateTime = TRUE)




