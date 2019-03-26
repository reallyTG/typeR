library(geostatsp)


### Name: RFsimulate
### Title: Simulation of Random Fields
### Aliases: RFsimulate modelRandomFields RFsimulate RFsimulate-methods
###   RFsimulate,ANY,Raster-method RFsimulate,numeric,SpatialGrid-method
###   RFsimulate,numeric,SpatialPixels-method
###   RFsimulate,numeric,SpatialPoints-method
###   RFsimulate,numeric,GridTopology-method
###   RFsimulate,RMmodel,GridTopology-method
###   RFsimulate,RMmodel,SpatialPoints-method
###   RFsimulate,matrix,Raster-method RFsimulate,matrix,Spatial-method
###   RFsimulate,data.frame,ANY-method
### Keywords: spatial

### ** Examples


model <- c(var=5, range=1,shape=0.5)


myraster = raster(nrows=20,ncols=30,xmn=0,ymn=0,xmx=6,ymx=4, 
		crs="+init=epsg:2081")

set.seed(0) 

simu <- RFsimulate(model, x=myraster, n=3)

plot(simu[['sim2']])

# conditional simulation
firstSample = RFsimulate(
	model, 
	x=SpatialPoints(myraster)[seq(1,ncell(myraster), len=100), ],
	n=3
)

secondSample = RFsimulate(
	model = cbind(var=5:3, range=1:3, shape=seq(0.5, 1.5, len=3)),
	x= myraster,
	data=firstSample,n=4
)

plot(secondSample)

# convert the model to RandomFields format and plot
if(requireNamespace('RandomFields', quietly=TRUE)) {
	RandomFields::plot(modelRandomFields(model))
}




