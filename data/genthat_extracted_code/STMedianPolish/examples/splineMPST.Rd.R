library(STMedianPolish)


### Name: splineMPST
### Title: Median polish Spline.
### Aliases: splineMPST

### ** Examples

## Not run:
library(zoo)
library(sp)
library(spacetime)
data(Metadb)
#records of monthly precipitation from january 2007 to january 2010
Metadb<-Metadb[,c(1:4,89:125)]
x<-matrix(0,1,37)
for(i in 1:37){
 x[,i] <- 2007 + (seq(0, 36)/12)[i]
}
x<-as.Date (as.yearmon(x), frac = 1)
time = as.POSIXct(x, tz = "GMT")
length(time)

MPST<-ConstructMPst(Metadb[,-c(1:4)],time,pts=Metadb[,2:4],Delta=c(7,6,5))

MpSTData<-MedianPolishM(MPST,eps=0, maxiter=2, na.rm=TRUE)
plot(MpSTData)
data(DemMeta)
xy = SpatialPoints(Metadb[,2:4],CRS(proj4string(DemMeta)))

data(HZRMeta)

polygon1 = polygons(HZRMeta)
Gridxy<- spsample(polygon1, cellsize=3000, n=300,"regular")

Grid<-data.frame(Gridxy,over(Gridxy,DemMeta))
colnames(Grid)<-c("East", "North","height")

TendenciaGrilla<-splineMPST(Grid,Ef_t=time[16:21],MPST,eps=0.01, maxiter=2)

IDs = paste("ID",1:nrow(TendenciaGrilla))
mydata = data.frame(values = TendenciaGrilla[,5], ID=IDs)
wind.ST1 = STFDF(SpatialPixels(Gridxy),time[16:21],mydata)
stplot(wind.ST1,col.regions=bpy.colors(40),par.strip.text = list(cex=0.7)
      ,main="Spline median polish: Monthly Precipitation")
## End(Not run)



