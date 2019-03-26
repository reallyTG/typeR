library(HistDAWass)


### Name: checkEmptyBins
### Title: Method 'checkEmptyBins'
### Aliases: checkEmptyBins checkEmptyBins,distributionH-method
### Keywords: distribution

### ** Examples


##---- A mydist distribution with an empty bin i.e. two consecutive values of p are equal----
mydist<-distributionH(x=c(1,2,3,10), p=c(0,0.5,0.5,1))
##---- Checks for empty byns and returns the newdist object without empty bins ----
newdist<-checkEmptyBins(mydist)




