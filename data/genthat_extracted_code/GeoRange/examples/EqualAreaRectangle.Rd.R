library(GeoRange)


### Name: EqualAreaRectangle
### Title: Create a rectangular shaped distribution with equal area to a
###   given area
### Aliases: EqualAreaRectangle

### ** Examples

HorseShoeTest<-PtsAlgHorseShoe(z=2000,spacing=1,endAngles=c(-90,90))
HorseShoePts<-RandHorseShoe(center=c(0,0),npts=100,HorseShoeShape=HorseShoeTest)
EqualAreaRectangle(TargetArea=as.numeric(HorseShoePts$TotalArea_km2),error=0.001)



