library(HistDAWass)


### Name: crwtransform
### Title: Method 'crwtransform': returns the centers and the radii of bins
###   of a distribution
### Aliases: crwtransform crwtransform,distributionH-method
### Keywords: distribution

### ** Examples


##---- A mydist distribution ----
mydist<-distributionH(x=c(1,2,3,10), p=c(0,0.1,0.5,1))
##---- Compute the cfd value for q=5 (not observed) ----
crwtransform(mydist)



