library(BMS)


### Name: lps.bma
### Title: Log Predictive Score
### Aliases: lps.bma
### Keywords: utilities

### ** Examples

 data(datafls)
 mm=bms(datafls,user.int=FALSE,nmodel=100)
 
 #LPS for actual values under the used data (static forecast)
 lps.bma(mm, realized.y=datafls[,1] , newdata=datafls[,-1])
 
 #the same result via predicitve.density
 pd=pred.density(mm, newdata=datafls[,-1])
 lps.bma(pd,realized.y=datafls[,1])
 
 # similarly for a linear model (not BMA)
 zz = zlm(datafls)
 lps.bma(zz, realized.y=datafls[,1] , newdata=datafls[,-1])
 



