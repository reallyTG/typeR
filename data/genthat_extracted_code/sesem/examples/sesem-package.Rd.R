library(sesem)


### Name: sesem-package
### Title: Spatial structural equation modeling (SESEM)
### Aliases: sesem-package sesem
### Keywords: package

### ** Examples

data=truelove
truelove_red<-truelove[c(1:60),c(1:7)]
distancematrix<-calc.dist(truelove_red)
Truelove_bins<-make.bin(distancematrix,type="ALL",p.dist=10)
binsize<-Truelove_bins[1][[1]] #truelove lowland bin sizes
binname<-Truelove_bins[2][[1]] #truelove lowland bin names

plotbin(distancematrix,binsize)

covariances<-make.covar(truelove_red,distancematrix,binsize,binname)
covariances

# reduced path model for the truelove dataset

spatial_model<-'
	N_Fix ~ Bryoph + Lich + SoilCrust
	SoilCrust ~ Bryoph + Lich	
	Lich ~ Bryoph + Moisture
	Bryoph ~ Moisture
	'

results<-runModels(spatial_model,covariances)
modelsummary(results)
plotmodelfit(results)
plotpath(results)




