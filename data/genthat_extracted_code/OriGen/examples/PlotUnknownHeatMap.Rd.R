library(OriGen)


### Name: PlotUnknownHeatMap
### Title: Plots a heat map depicting the probability an unknown individual
###   comes from each block
### Aliases: PlotUnknownHeatMap
### Keywords: Localization Ancestry Plot

### ** Examples


#this example not run because it takes slightly longer than 5 secs
#note - type example(FunctionName, run.dontrun=TRUE) to run the example where FunctionName is
#the name of the function

## Not run: 
##D 
##D #Data generation
##D SampleSites=10
##D NumberSNPs=5
##D TestData=array(sample(2*(1:30),2*SampleSites*NumberSNPs,replace=TRUE),
##D 	dim=c(2,SampleSites,NumberSNPs))
##D #Europe is about -9 to 38 and 34 to 60
##D TestCoordinates=array(0,dim=c(SampleSites,2))
##D TestCoordinates[,1]=runif(SampleSites,-9,38)
##D TestCoordinates[,2]=runif(SampleSites,34,60)
##D 
##D #This code simulates the number of major alleles the unknown individuals have.
##D NumberUnknowns=2
##D TestUnknowns=array(sample(0:2,NumberUnknowns*NumberSNPs,replace=TRUE),
##D 	dim=c(NumberUnknowns,NumberSNPs))
##D 
##D #Fitting the model
##D #MaxGridLength is the maximum number of boxes allowed to span the region in either direction
##D #RhoParameter is a tuning constant
##D trials4=FitOriGenModelFindUnknowns(TestData,TestCoordinates,TestUnknowns,
##D 	MaxGridLength=20,RhoParameter=10)
##D str(trials4)
##D 
##D #Plotting the unknown heat map
##D PlotUnknownHeatMap(trials4,UnknownNumber=1,MaskWater=TRUE)
##D 
## End(Not run)



