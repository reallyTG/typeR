library(cordillera)


### Name: cordillera-package
### Title: cordillera: The OPTICS Cordillera
### Aliases: cordillera-package

### ** Examples

data(CAClimateIndicatorsCountyMedian)

res<-princomp(CAClimateIndicatorsCountyMedian[,3:52])
res
summary(res)

library(scatterplot3d)
scatterplot3d(res$scores[,1:3])

irisrep3d<-res$scores[,1:3]
irisrep2d<-res$scores[,1:2]


#OPTICS in dbscan version
library(dbscan)
ores<-optics(irisrep2d,minPts=15,eps=100)
plot(ores)
#OPTICS cordillera for the 2D representation
cres2d<-cordillera(irisrep2d,minpts=15)
cres2d
summary(cres2d)
plot(cres2d)

#OPTICS cordillera for the 3D representation
cres3d<-cordillera(irisrep3d,minpts=15)
cres3d
summary(cres3d)
plot(cres3d)

## No test: 
#OPTICS in ELKI version
ores<-e_optics(irisrep2d,minpts=10,epsilon=100)
ores
summary(ores)
plot(ores)
## End(No test)



