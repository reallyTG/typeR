library(OriGen)


### Name: GenerateHeatMaps
### Title: Fit OriGen microsatellite allele frequency surfaces
### Aliases: GenerateHeatMaps
### Keywords: localization Ancestry

### ** Examples


#this example not run because it takes longer than 5 secs
#note - type example(FunctionName, run.dontrun=TRUE) to run the example where FunctionName is
#the name of the function

## Not run: 
##D 
##D ##Data generation
##D SampleSites=10
##D NumberLoci=4
##D MaxAlleles=4
##D NumberAllelesAtEachLocus=sample(2:MaxAlleles,NumberLoci,replace=TRUE)
##D TestData=array(0,dim=c(MaxAlleles,SampleSites,NumberLoci))
##D for(i in 1:NumberLoci){
##D 	for(j in 1:NumberAllelesAtEachLocus[i]){
##D 		TestData[j,,i]=sample(1:10,SampleSites,replace=TRUE)
##D 	}
##D }
##D ##This data is simulated in Europe which is around Longitude -9 to 38 and Latitude 34 to 60
##D TestCoordinates=array(0,dim=c(SampleSites,2))
##D TestCoordinates[,1]=runif(SampleSites,-9,38)
##D TestCoordinates[,2]=runif(SampleSites,34,60)
##D 
##D ##This simulates the unknown data
##D NumberUnknowns=2
##D UnknownData=array(0,dim=c(NumberUnknowns,2,NumberLoci))
##D for(i in 1:NumberUnknowns){
##D 	for(j in 1:NumberLoci){
##D 		UnknownData[i,,j]=sample(1:NumberAllelesAtEachLocus[j],2)
##D 	}
##D }
##D 
##D ##MaxGridLength is the maximum number of boxes allowed 
##D ##to span the region in either direction
##D ##Note that this number was reduced to allow the example to run in less than 5 secs
##D ##RhoParameter is a tuning constant
##D print("MaxGridLength is intentionally set really low for fast examples. 
##D 	Meaningful results will most likely require a higher value.")
##D 
##D ##Fits the allele frequency surfaces only
##D SurfaceTrials=FitMultinomialModel(TestData,TestCoordinates,
##D 	MaxGridLength=20,RhoParameter=10)
##D str(SurfaceTrials)
##D ##Plotting the model
##D PlotAlleleFrequencySurface(SurfaceTrials,LocusNumber=1,AlleleNumber=1,
##D 	MaskWater=TRUE,Scale=FALSE)
##D 
##D ##You can generate heatmaps of unknown individual's placements from with the allele
##D ##surfaces using GenerateHeatMaps or use FitMultinomialModelFindUnknowns
##D HeatMapTrials=GenerateHeatMaps(SurfaceTrials,UnknownData,NumberLoci=NumberLoci)
##D ##Plotting the unknown heat map
##D PlotUnknownHeatMap(HeatMapTrials,UnknownNumber=1,MaskWater=TRUE)
##D 	
##D ##Fitting the model and finding the unknown locations
##D #UnknownTrials=FitMultinomialModelFindUnknowns(TestData,TestCoordinates,
##D #	UnknownData,MaxGridLength=20,RhoParameter=10)
##D #str(UnknownTrials)
##D ##Plotting the unknown heat map
##D #PlotUnknownHeatMap(UnknownTrials,UnknownNumber=1,MaskWater=TRUE)
##D 
##D ##Fitting the admixed model
##D #AdmixedTrials=FitMultinomialAdmixedModelFindUnknowns(TestData,TestCoordinates,
##D #	UnknownData,MaxGridLength=10,RhoParameter=10)
##D ##Plots the admixed surface disregarding fractions less than 0.01
##D #PlotAdmixedSurface(AdmixedTrials,UnknownNumber=1)
##D 
## End(Not run)




