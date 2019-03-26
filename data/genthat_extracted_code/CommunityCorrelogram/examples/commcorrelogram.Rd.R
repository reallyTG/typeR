library(CommunityCorrelogram)


### Name: commcorrelogram
### Title: Community Correlogram
### Aliases: commcorrelogram
### Keywords: multivariate spatial chron

### ** Examples

#spatial community ANOSIM correlogram
data(mite)
data(mite.xy)
commcorrelogram(sampleData=mite,sampleLocation=cbind(mite.xy,z=0)
,lagSize=0.3,lagNumber=17,lagTol=0.15,option=1,numTests=5)

## Not run: 
##D   #spatial community Mantel correlogram
##D   data(mite)
##D   data(mite.xy)
##D   commcorrelogram(sampleData=mite,sampleLocation=cbind(mite.xy,z=0)
##D   ,lagSize=0.3,lagNumber=17,lagTol=0.15,option=1,metric="mantel"
##D   ,mantmeth="spearman",numTests=9)
##D   
##D   #anisotropic community correlograms
##D   commcorrelogram(sampleData=mite,sampleLocation=cbind(mite.xy,z=0)
##D   ,lagSize=0.3,lagNumber=8,lagTol=0.15,option=1,anisotropic=TRUE
##D   ,azimuth=0,azimuthTol=15,bandwidth=2,numTests=9,dipAngle=0
##D   ,dipTol=90,dipBandwidth=1)
##D   
##D   commcorrelogram(sampleData=mite,sampleLocation=cbind(mite.xy,z=0)
##D   ,lagSize=0.5,lagNumber=10,lagTol=0.25,option=1,anisotropic=TRUE
##D   ,azimuth=90,azimuthTol=15,bandwidth=2,numTests=9,dipAngle=0
##D   ,dipTol=90,dipBandwidth=1)
##D   
##D   commcorrelogram(sampleData=mite,sampleLocation=cbind(mite.xy,z=0)
##D   ,lagSize=0.5,lagNumber=10,lagTol=0.25,option=1,anisotropic=TRUE
##D   ,azimuth=45,azimuthTol=15,bandwidth=2,numTests=9,dipAngle=0
##D   ,dipTol=90,dipBandwidth=1)
##D   
##D   #temporal community correlogram
##D   data(pyrifos)
##D   pyrifos.levels<-data.frame(ditch=gl(12,1,length=132),
##D   dose=factor(rep(c(0.1, 0, 0, 0.9, 0, 44, 6, 0.1, 44, 0.9, 0, 6),11)),
##D       week=as.numeric(as.character(gl(11, 12,
##D       labels=c(-4, -1, 0.1, 1, 2, 4, 8, 12, 15, 19, 24)))))
##D   commcorrelogram(sampleData=pyrifos,sampleTime=pyrifos.levels$week,
##D   option=2,lagSize=3,lagTol=1.5,numTests=9,lagNumber=10)
##D   
##D   #temporal community correlogram holding location constant
##D   commcorrelogram(sampleData=pyrifos,sampleTime=pyrifos.levels$week,
##D   LocationNames=pyrifos.levels$ditch,option=4,lagSize=3,lagTol=1.5,
##D   numTests=9,lagNumber=10)
## End(Not run)



