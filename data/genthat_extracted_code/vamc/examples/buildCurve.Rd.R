library(vamc)


### Name: buildCurve
### Title: Bootstrap discount factors from a yield curve.
### Aliases: buildCurve

### ** Examples

rate <- c(0.69, 0.77, 0.88, 1.01, 1.14, 1.38, 1.66, 2.15) * 0.01
tenor <- c(1, 2, 3, 4, 5, 7, 10, 30)
fixFreq <- 6
fixDCC <- "Thirty360"
fltFreq <- 6
fltDCC <- "ACT360"
calendar <- "NY"
bdc <- "Modified_Foll"
curveDate <- "2016-02-08"
numSetDay <- 2
yieldCurveDCC <- "Thirty360"
buildCurve(rate, tenor, fixFreq, fixDCC, fltFreq, fltDCC, calendar, bdc,
           curveDate, numSetDay, yieldCurveDCC)



