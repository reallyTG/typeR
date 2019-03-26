library(driftR)


### Name: dr_drop
### Title: Dropping observations from the monitoring period
### Aliases: dr_drop

### ** Examples

testData <- data.frame(
   Date = c("9/18/2015", "9/18/2015", "9/18/2015", "9/18/2015", "9/19/2015", "9/21/2015"),
   Time = c("12:10:49", "12:15:50", "12:20:51", "12:25:51", "12:30:51", "12:35:51"),
   Temp = c(14.76, 14.64, 14.57, 14.51, 14.50, 14.63),
   SpCond = c(0.754, 0.750, 0.750, 0.749, 0.749, 0.749),
   stringsAsFactors = FALSE
 )

 dr_drop(testData, head = 2)
 dr_drop(testData, tail = 1)
 dr_drop(testData, head = 2, tail = 1)
 dr_drop(testData, dateVar = Date, timeVar = Time, from = "9/19/2015")
 dr_drop(testData, dateVar = Date, timeVar = Time, from = "9/18/2015 12:25:51")
 dr_drop(testData, dateVar = Date, timeVar = Time, to = "9/19/2015")
 dr_drop(testData, dateVar = Date, timeVar = Time, to = "9/18/2015 12:25:51")
 dr_drop(testData, dateVar = Date, timeVar = Time, from = "9/18/2015 12:25:51",
     to = "9/19/2015 12:30:51")
 dr_drop(testData, dateVar = Date, timeVar = Time, from = "9/18/2015 12:00", to = "9/19/2015 13:00")
 dr_drop(testData, exp = Temp > 14.7)




