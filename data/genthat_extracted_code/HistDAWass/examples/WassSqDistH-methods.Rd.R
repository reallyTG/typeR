library(HistDAWass)


### Name: WassSqDistH
### Title: Method 'WassSqDistH'
### Aliases: WassSqDistH WassSqDistH,distributionH,distributionH-method
###   WassSqDistH,distributionH-method
### Keywords: distribution

### ** Examples

##---- create two distributionH objects ----
 mydist1=distributionH(x=c(1,2,3),p=c(0, 0.4, 1))
 mydist2=distributionH(x=c(7,8,10,15),p=c(0, 0.2, 0.7, 1))
# -- compute the squared L2 Waaserstein distance
WassSqDistH(mydist1,mydist2)
# -- compute the squared L2 Waaserstein distance with details
WassSqDistH(mydist1,mydist2,details=TRUE)



