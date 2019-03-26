library(rgr)


### Name: thplot2
### Title: Display a Thompson-Howarth Plot of Duplicate Measurements,
###   Alternate Input
### Aliases: thplot2
### Keywords: univar htest hplot

### ** Examples

## NOTE: the examples below are commented out as thplot1 makes a
## call to the locator function that fails when the examples are run
## during package checking and building

## Make test data available
##data(ms.data2)
##attach(ms.data2)
 
## Display the default plot
##thplot2(MS, xname = "Magnetic Susceptibility", 
##	main = "Stanley (2003) Test Data")

## Detach test data
##detach(ms.data2)

## Make test data available
##data(ms.data3)
##attach(ms.data3)

## Display a Thompson-Howarth plot for a RSD of 7.5% and draw
## the limit for a confidence interval of 90%
##thplot2(MS, xname = "Magnetic Susceptibility", rsd = 7.5, ptile = 90,
##	main = "Stanley (2003) Test Data", ifalt = TRUE)

## Detach test data
##detach(ms.data3)



