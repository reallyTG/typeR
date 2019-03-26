library(sidier)


### Name: barcode.gap
### Title: Barcode gap identification
### Aliases: barcode.gap

### ** Examples


my.dist<-matrix(abs(rnorm(100)),ncol=10,
dimnames=list(paste("sp",rep(1:5,2),sep=""),
paste("sp",rep(1:5,2),sep="")))
my.dist<-as.matrix(as.dist(my.dist))
sum<-barcode.summary(my.dist)
barcode.gap(sum)




