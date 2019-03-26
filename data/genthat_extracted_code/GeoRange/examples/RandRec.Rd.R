library(GeoRange)


### Name: RandRec
### Title: Function to randomly generate points within a given rectangular
###   shaped distribution
### Aliases: RandRec

### ** Examples

HorseShoeTest<-PtsAlgHorseShoe(z=2000,spacing=1,endAngles=c(-90,90))
HorseShoePts<-RandHorseShoe(center=c(0,0),npts=100,HorseShoeShape=HorseShoeTest)
RecOutline<-EqualAreaRectangle(TargetArea=as.numeric(HorseShoePts$TotalArea_km2),error=0.001)
RandRec(RecShape=RecOutline,npts=100)



