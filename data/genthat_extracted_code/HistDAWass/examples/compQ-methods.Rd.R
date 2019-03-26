library(HistDAWass)


### Name: compQ
### Title: Method 'compQ'
### Aliases: compQ compQ,distributionH,numeric-method
###   compQ,distributionH-method

### ** Examples


##---- A mydist distribution ----
mydist<-distributionH(x=c(1,2,3,10), p=c(0,0.1,0.5,1))
##---- Compute the quantile of mydist for different values of p ----
y<-compQ(mydist,0.5) #the median
y<-compQ(mydist,0) #the minimum
y<-compQ(mydist,1) #the maximum
y<-compQ(mydist,0.25) #the first quartile
y<-compQ(mydist,0.9) #the ninth decile




