library(motmot.2.0)


### Name: transformRateMatrix
### Title: Conversion among data and phylogeny objects
### Aliases: transformRateMatrix

### ** Examples

 data(anolis.tree)
 data(anolis.data)
 ## Convert data to class rateData with a rateMatrix object as input
 anolis.rateMatrix <- as.rateMatrix(phy=anolis.tree, x="geo_ecomorph", data=anolis.data)
 anolis.rateData <- as.rateData(y="Female_SVL", x="geo_ecomorph", 
 rateMatrix = anolis.rateMatrix, phy=NULL, data=anolis.data, log.y=TRUE)
 
 # Tranform the expected variance covariance matrix so that the rates in the first and last 
 # categories are equal (both 1) whereas the rate in the second category is twice as fast (2) and 
 # the rate in the third category is ten times slower.
 
 trans.anolis.rateData <- transformRateMatrix(rateData=anolis.rateData, rate = c(1,2,0.1,1))



