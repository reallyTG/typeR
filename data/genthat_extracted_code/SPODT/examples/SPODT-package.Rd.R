library(SPODT)


### Name: SPODT-package
### Title: SPatial Oblique Decision Tree
### Aliases: SPODT-package SPODT
### Keywords: package

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
		  
spodt.tree(sp)

ssp<-spodtSpatialLines(sp,dataMALARIA)
plot(ssp)
points(dataMALARIA,cex=log(dataMALARIA@data$z*10))

#test.spodt(dataMALARIA@data[,2]~1, dataMALARIA, sp@R2, "rpois",
#           c(length(dataMALARIA@data$loc),mean(dataMALARIA@data$z)), 10,
#		   weight=TRUE, graft=gr, level.max=lmx, min.parent=parm,
#		   min.child=childm,rtwo.min=rtw)

#the warning "root is a leaf" tells that no split can be provided by the
    #spodt function according to the splitting parameters



