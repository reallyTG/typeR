library(driftR)


### Name: dr_replace
### Title: Replacing problematic observations from the monitoring period
### Aliases: dr_replace

### ** Examples

testData <- data.frame(
   Date = c("9/18/2015", "9/18/2015", "9/18/2015", "9/18/2015", "9/19/2015", "9/21/2015"),
   Time = c("12:10:49", "12:15:50", "12:20:51", "12:25:51", "12:30:51", "12:35:51"),
   Temp = c(14.76, 14.64, 14.57, 14.51, 14.50, 14.63),
   SpCond = c(0.754, 0.750, 0.750, 0.749, 0.749, 0.749),
   stringsAsFactors = FALSE
 )

 dr_replace(testData, sourceVar = Temp, dateVar = Date, timeVar = Time,
     from = "2015-09-19 12:30:51", to = "2015-09-21 12:35:51")
 dr_replace(testData, sourceVar = Temp, dateVar = Date, timeVar = Time,
     from = "2015-09-19", to = "2015-09-21")
 dr_replace(testData, sourceVar = Temp, dateVar = Date, timeVar = Time, from = "2015-09-19")
 dr_replace(testData, sourceVar = Temp, dateVar = Date, timeVar = Time, to = "2015-09-19")
 dr_replace(testData, sourceVar = Temp, cleanVar = temp2, dateVar = Date, timeVar = Time,
     to = "09/19/2015 12:35:51")
 dr_replace(testData, sourceVar = Temp, overwrite = TRUE, exp = Temp > 14.75)




