library(sesem)


### Name: plotpath
### Title: Function to plot spatial SEM results for individual paths
### Aliases: plotpath
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

plotpath(truelove_results)
truelove_results[[2]]# list of path names
plotpath(truelove_results,path.type="user",selectpath=c(5,7,8))





