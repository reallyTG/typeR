library(FatTailsR)


### Name: extractData
### Title: Datasets dfData, mData, tData, xData, zData, extractData :
###   extractData
### Aliases: extractData

### ** Examples

   

library(zoo) 
library(xts) 
library(timeSeries) 

### dfData, tData, xData, zData : prices only
attributes(dfData); attributes(tData); attributes(xData); attributes(zData) 
lapply(dfData, head, 3)
lapply( mData, head, 3)
lapply( tData, head, 3)
lapply( xData, head, 3)
lapply( zData, head, 3)

### extractData : prices and logreturns
head(ptD <- extractData("p", "tss", "2009-01-01", "2012-12-31")) ; tail(ptD)
head(rtD <- extractData("r", "tss")) 
head(pxD <- extractData("p", "xts")) 
head(rxD <- extractData("r", "xts")) 
head(pzD <- extractData("p", "zoo")) 
head(rzD <- extractData("r", "zoo")) 
head(pbD <- extractData("p", "bfr")) 
head(rbD <- extractData("r", "bfr")) 
head(pmD <- extractData("p", "mat")) 
head(rmD <- extractData("r", "mat")) 

### Remove item CHF (negative prices) from dfData, tData, xData, zData
Z <- dfData[names(dfData)[1:9]]; attributes(Z)
Z <- tData[names(tData)[1:9]]; attributes(Z)
Z <- xData[names(xData)[1:9]]; attributes(Z)
Z <- zData[names(zData)[1:9]]; attributes(Z)




