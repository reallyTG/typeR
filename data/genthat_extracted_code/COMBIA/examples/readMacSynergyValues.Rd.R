library(COMBIA)


### Name: readMacSynergyValues
### Title: Read data from macsynergyII formate and clean for outliers
### Aliases: readMacSynergyValues

### ** Examples

fl <- system.file("extdata", "testData.csv", package="COMBIA")
sh <- 1
wellR <- list(c( "l3:l10","m3:m10","b3:k10",  "l13:l20","m13:m20","b13:k20", 
           "l23:l30","m23:m30","b23:k30",  "l33:l40","m33:m40","b33:k40"))
minThersholdForCV <- 0.3
minThersholdForCVCal <- 0.1
survivalFunc <-  function (x,y,z) {(x-z)/(y-z)}
rslt <- readMacSynergyValues(fl, sh, nrow=41, wellR,  
minThersholdForCVCal, minThersholdForCV, survivalFunc)



