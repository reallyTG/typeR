library(longitudinalData)


### Name: ParLongData-class
### Title: ~ Class: ParLongData ~
### Aliases: ParLongData ParLongData-class [,ParLongData-method
###   [<-,ParLongData-method
### Keywords: classes cluster

### ** Examples

   ### Building ParLongData
   parMyData <- parLongData(type="n",col=3,pch="1",pchPeriod=20,cex=1,xlab="Time",ylab="Size")

   ### Get
   parMyData['col']

   ### Set
   parMyData['cex'] <- 3
   (parMyData)



