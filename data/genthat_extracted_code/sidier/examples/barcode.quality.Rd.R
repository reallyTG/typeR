library(sidier)


### Name: barcode.quality
### Title: Estimates of barcode quality
### Aliases: barcode.quality

### ** Examples

my.dist<-matrix(abs(rnorm(100)),ncol=10,
dimnames=list(paste("sp",rep(1:5,2),sep=""),
paste("sp",rep(1:5,2),sep="")))
my.dist<-as.matrix(as.dist(my.dist))

barcode.quality(dismat=my.dist,threshold=0.2,refer2max=FALSE,save.file=TRUE,
modFileName="Modules_summary.txt",verbose=FALSE,output="list")



