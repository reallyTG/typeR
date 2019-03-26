library(STMedianPolish)


### Name: krige0STlocalMP
### Title: Ordinary local Spatio - temporal Kriging
### Aliases: krige0STlocalMP

### ** Examples

library(spacetime)
library(sp)
library(gstat)
library(zoo)
library(maptools)
data(Metadb)
#records of the precipitation monthly from january 2007 to january 2010
Metadb<-Metadb[,c(1:4,89:125)]
x<-matrix(0,1,37)
for(i in 1:37){
  x[,i] <- 2007 + (seq(0, 36)/12)[i]
}
x<-as.Date (as.yearmon(x), frac = 1)
time = as.POSIXct(x, tz = "GMT")

MPST<-ConstructMPst(sqrt(0.5+Metadb[,-c(1:4)]),time,pts=Metadb[,2:4],Delta=c(7,6,5))
residual<-removetrendMPst(MPST,eps=0.01, maxiter=2)
rain.loc<-Metadb[,c("Station","East","North","Height")]
coordinates(rain.loc) = ~East+North+Height
proj4string(rain.loc) = CRS(proj4string(DemMeta))
rain_residual = stConstruct(data.frame(Res=residual[,7]), space = list(values = 1),
                            time, SpatialObj = rain.loc,interval=TRUE)

#NewData
data(HZRMeta)
polygon1 = polygons(HZRMeta)
Gridxy<- spsample(polygon1, cellsize=10000, n=1000,"regular")
Gridxyz<-data.frame(Gridxy,over(Gridxy,DemMeta))
colnames(Gridxyz)<-c("East", "North","height")
Grid_pred <- STF(sp=SpatialPoints(Gridxyz,CRS(proj4string(DemMeta))), time=time[c(18,19)])

#Product - sum covariance model generalized
p=c(2,12.98,13899.95,3.44,14.95,1.84,3.92,-0.07)
CS = function(h,p){p[2]*exp(-h/p[3])}
CT = function(u,p){p[4]*exp(-u/p[5])+ p[6]*cos(pi*u/180)+p[7]*(1-abs(sin(pi*u/180)))}
CST<-function(h,u,p){0.084*CT(u,p)+ 0.32*CS(h,p)+0.07*CT(u,p)*CS(h,p)}
data(VRes)
stAni<-estiStAni(VRes, interval=c(10, 100))

PredictValue<-krige0STlocalMP(data=rain_residual,newdata=Grid_pred,p,model=CST,k=10,stAni)
IDs = paste("ID",1)
mydata = data.frame(PredictValue[,5], ID=IDs)
wind.ST1 = STFDF(SpatialPixels(Gridxy),time[c(18,19)],mydata)
stplot(wind.ST1,col.regions=bpy.colors(40),par.strip.text = list(cex=0.7)
       ,main="Kriging ordinary residuals: Prediction surface")



