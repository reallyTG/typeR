library(sesem)


### Name: plotmodelfit
### Title: Function to plot model fit indices for spatial SEM analyses
### Aliases: plotmodelfit
### Keywords: spatial

### ** Examples

#data=truelove
#distancematrix<-calc.dist(truelove)
#Truelove_bins<-make.bin(distancematrix,type="ALL",p.dist=20)
#binsize<-Truelove_bins[1][[1]] #truelove lowland bin sizes
#binname<-Truelove_bins[2][[1]] #truelove lowland bin names

#covariances<-make.covar(truelove,distancematrix,binsize,binname)
#covariances

# path model for the truelove dataset
#spatial_model<-'
#	Gram ~ Moisture
#	N_Fix ~ Bryoph + Lich + SoilCrust
#	SoilCrust ~ Bryoph + Lich + Gram + Shrubs + Forbs	
#	Bryoph ~ Gram + Shrubs + Forbs + Moisture
#	Lich ~ Moisture + Forbs + Gram + Shrubs + Bryoph
#	Forbs ~ Moisture
#	Gram ~~ Forbs
#	Shrubs ~ Moisture	
#	Gram ~~ Shrubs
#	Shrubs ~~ Forbs
#	'
#
#results<-runModels(spatial_model,covariances)

#The above script produces the sesem object stored as truelove_results

data=truelove_results

plotmodelfit(truelove_results) #note that the warnings that arise here can be ignored
plotmodelfit(truelove_results,rmsea_err=FALSE)
plotmodelfit(truelove_results,plots="chi")





