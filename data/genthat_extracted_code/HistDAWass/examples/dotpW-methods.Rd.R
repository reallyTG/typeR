library(HistDAWass)


### Name: dotpW
### Title: Method 'dotpW'
### Aliases: dotpW dotpW,distributionH,distributionH-method
###   dotpW,distributionH-method dotpW,numeric,distributionH-method
###   dotpW,distributionH-method dotpW,distributionH,numeric-method
###   dotpW,distributionH-method
### Keywords: distribution

### ** Examples


## let's define two distributionH objects
mydist1<-distributionH(x=c(1,2,3,10), p=c(0,0.1,0.5,1))
mydist2<-distributionH(x=c(5,7,15), p=c(0,0.7,1))

## the dot product between the distributions
dotpW(mydist1,mydist2) #---> 39.51429

## the dot product between a distribution and a numeric
dotpW(mydist1,3)  #---> 13.2
dotpW(3,mydist1)  #---> 13.2





