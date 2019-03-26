library(HistDAWass)


### Name: compP
### Title: Method 'compP'
### Aliases: compP compP,distributionH,numeric-method
###   compP,distributionH-method
### Keywords: distribution

### ** Examples


##---- A mydist distribution ----
mydist<-distributionH(x=c(1,2,3,10), p=c(0,0.1,0.5,1))
##---- Compute the cfd value for q=5 (not observed) ----
p<-compP(mydist,5)




