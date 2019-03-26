library(rgr)


### Name: thplot1
### Title: Display a Thompson-Howarth Plot of Duplicate Measurements
### Aliases: thplot1
### Keywords: univar htest hplot

### ** Examples

## NOTE: the examples below are commented out as thplot1 makes a
## call to the locator function that fails when the examples are run
## during package checking and building
 
## Make the Stanley (2003) test data available
##data(ms.data1)
##attach(ms.data1)

## Display the default plot
##thplot1(MS.1, MS.2, xname = "Magnetic Susceptibility", 
##	main = "Stanley (2003) Test Data")

## Display a Thompson-Howarth plot for a RSD of 7.5% and a draw the limit
## for a confidence interval of 90%
##thplot1(MS.1, MS.2, xname = "Magnetic Susceptibility", rsd = 7.5, 
##	ptile = 90, main = "Stanley (2003) Test Data")
     
## Detach test data
##detach(ms.data1)



