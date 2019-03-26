library(OriGen)


### Name: PlotAlleleFrequencySurfaceOld
### Title: Plots an OriGen fitted allele frequency surface
### Aliases: PlotAlleleFrequencySurfaceOld
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
##D #Fitting the model
##D #MaxGridLength is the maximum number of boxes allowed to span the region in either direction
##D #RhoParameter is a tuning constant
##D trials2=FitOriGenModel(TestData,TestCoordinates,MaxGridLength=20,RhoParameter=10)
##D str(trials2)
##D 
##D #Plotting the model
##D PlotAlleleFrequencySurfaceOld(trials2)
##D 
## End(Not run)



