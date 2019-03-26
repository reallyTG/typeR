library(OriGen)


### Name: FitOriGenModel
### Title: Fit OriGen allele frequency surfaces
### Aliases: FitOriGenModel
### Keywords: localization Ancestry

### ** Examples


#this example not run because it takes slightly longer than 5 secs
#note - type example(FunctionName, run.dontrun=TRUE) to run the example where FunctionName is
#the name of the function

## Not run: 
##D 
##D #Note see the help files for ConvertPEDData and ConvertUnknownPEDData if you have Plink PED files
##D 
##D #Data generation
##D SampleSites=10
##D NumberSNPs=5
##D TestData=array(sample(2*(1:30),2*SampleSites*NumberSNPs,
##D 	replace=TRUE),dim=c(2,SampleSites,NumberSNPs))
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
##D PlotAlleleFrequencySurface(trials2)
##D 
## End(Not run)



