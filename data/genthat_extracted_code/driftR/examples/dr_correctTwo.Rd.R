library(driftR)


### Name: dr_correctTwo
### Title: Two-point drift correction
### Aliases: dr_correctTwo

### ** Examples

testData <- data.frame(
   Date = c("9/18/2015", "9/18/2015", "9/18/2015", "9/18/2015", "9/18/2015", "9/18/2015"),
   Time = c("12:10:49", "12:15:50", "12:20:51", "12:25:51", "12:30:51", "12:35:51"),
   Temp = c(14.76, 14.64, 14.57, 14.51, 14.50, 14.63),
   pH = c(7.18, 7.14, 7.14, 7.13, 7.13, 7.13),
   corrFac = c(0.0000000, 0.2003995, 0.4007989, 0.6005326, 0.8002663, 1.0000000),
   stringsAsFactors = FALSE
 )

 dr_correctTwo(testData, sourceVar = pH, cleanVar = pH_Corr, calValLow = 7.01, calStdLow = 7,
     calValHigh = 11.8, calStdHigh =  10, factorVar = corrFac)




