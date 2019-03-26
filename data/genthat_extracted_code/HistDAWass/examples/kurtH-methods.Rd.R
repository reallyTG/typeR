library(HistDAWass)


### Name: kurtH
### Title: Method 'kurtH': computes the kurthosis of a distribution
### Aliases: kurtH kurtH,distributionH-method
### Keywords: distribution

### ** Examples


##---- A mydist distribution ----
mydist<-distributionH(x=c(1,2,3,10), p=c(0,0.1,0.5,1))
##---- Compute the kurtosis of mydist ----
kurtH(mydist) #---> 1.473242




