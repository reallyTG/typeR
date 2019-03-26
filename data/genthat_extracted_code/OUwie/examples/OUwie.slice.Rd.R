library(OUwie)


### Name: OUwie.slice
### Title: Generalized Hansen models with time slices
### Aliases: OUwie.slice
### Keywords: models

### ** Examples

data(tworegime)

##Here we want a fixed slice at T=2, assuming the present is T=0:
#library(phytools)
#max.height <- max(nodeHeights(tree))
#timeslices <- max.height - 2
#timeslices <- c(0,timeslices)
#phy.sliced<-make.era.map(tree,timeslices)
#leg<-c("blue3","red3")
#names(leg)<-c(1,2)
#plotSimmap(phy.sliced,leg, pts=FALSE, ftype="off", lwd=1)

##Now fit an BMS model with a single fixed timeslice at time=2:
#ppBM<-OUwie.slice(tree,trait[,c(1,3)],model=c("BMS"), root.station=TRUE, timeslices=c(2))

##Fit an OU model with a single fixed timeslice:
#ppOUM<-OUwie.slice(tree,trait[,c(1,3)],model=c("OUM"), root.station=TRUE, timeslices=c(2))

##Fit an BMS model with an unknown timeslice:
#ppBM<-OUwie.slice(tree,trait[,c(1,3)],model=c("BMS"), root.station=TRUE, timeslices=c(NA))

##Fit an BMS model with an unknown and a fixed timeslice:
#ppBM<-OUwie.slice(tree,trait[,c(1,3)],model=c("BMS"), root.station=TRUE, timeslices=c(NA,2))




