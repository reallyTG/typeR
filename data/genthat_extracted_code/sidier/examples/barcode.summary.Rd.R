library(sidier)


### Name: barcode.summary
### Title: Summary of the inter- and intraspecific distances
### Aliases: barcode.summary

### ** Examples


my.dist<-matrix(abs(rnorm(100)),ncol=10,
dimnames=list(paste("sp",rep(1:5,2),sep=""),
paste("sp",rep(1:5,2),sep="")))
my.dist<-as.matrix(as.dist(my.dist))
barcode.summary(my.dist)




