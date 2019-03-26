library(SPODT)


### Name: spodt
### Title: Spatial Oblique Decision Tree main function
### Aliases: spodt
### Keywords: SPODT Spatial Oblique Decision Tree spatial partitioning

### ** Examples

data(dataMALARIA)
#Example : number of malaria episodes per child at each household,
          #from November to December 2009, Bandiagara, Mali.
#Copyright: Pr Ogobara Doumbo, MRTC, Bamako, Mali. email: okd[at]icermali.org
coordinates(dataMALARIA)<-c("x","y")
class(dataMALARIA)
proj4string(dataMALARIA)<-"+proj=longlat +datum=WGS84 +ellps=WGS84"
dataMALARIA<-spTransform(dataMALARIA, CRS("+proj=merc +datum=WGS84 +ellps=WGS84"))

gr<-0.07   #graft parameter
rtw<-0.01 #rtwo.min
parm<-25  #min.parent
childm<-2 #min.child
lmx<-7 

sp<-spodt(dataMALARIA@data[,2]~1, dataMALARIA, weight=TRUE, graft=gr, min.ch=childm,
          min.parent=parm, level.max=lmx, rtwo.min=rtw)
sp
sp@R2

#the warning "root is a leaf" tells that no split can be provided by the
    # spodt function according to the splitting parameters



