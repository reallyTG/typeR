library(QHOT)


### Name: QHOT
### Title: QTL Hotspot Detection
### Aliases: QHOT

### ** Examples

Trait<-paste("t",sample(1:9,100,replace=TRUE,prob=c(2,rep(1,8))/10),sep="")
chr<-1
L<-sample(seq(0,90,by=10),100,replace=TRUE,prob=c(0.5,0.5,5.5,rep(0.5,7))/10)
R<-L+sample(c(0.5,1,5,10,50),100,replace=TRUE)
R[R>100]<-100
DataQTL.t<-data.frame(Trait,chr,L,R)
DataCrop.t<-data.frame(chr=1,center=75,length=100)
QHOT(DataQTL.t, DataCrop.t, ScanStep=0.5, NH=1, NP=1000)



