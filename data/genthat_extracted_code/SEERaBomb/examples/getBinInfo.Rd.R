library(SEERaBomb)


### Name: getBinInfo
### Title: Gets the lower and upper limit and index of a tsd bin
### Aliases: getBinInfo
### Keywords: internal

### ** Examples

library(SEERaBomb)
brks=c(0,0.25,1,3,5)  
(binS=levels(cut(brks+0.1,breaks=c(brks,100)))) #make a vector of intervals 
getBinInfo(binS[4],binS) # test getBinInfo



