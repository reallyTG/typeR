library(timeSeries)


### Name: print-methods
### Title: Print a Time Series
### Aliases: show,timeSeries-method print,timeSeries-method
### Keywords: chron

### ** Examples

## Load Micsrosoft Data - 
   setRmetricsOptions(myFinCenter = "GMT")
   LPP <- MSFT[1:12, 1:4]

## Abbreviate Column Names - 
   colnames(LPP) <- abbreviate(colnames(LPP), 6)
   
## Print Data Set -
   print(LPP)
   
## Alternative Use, Show Data Set - 
   show(LPP)



