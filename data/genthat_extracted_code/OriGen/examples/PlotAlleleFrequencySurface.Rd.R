library(OriGen)


### Name: PlotAlleleFrequencySurface
### Title: Plots an OriGen fitted allele frequency surface
### Aliases: PlotAlleleFrequencySurface
### Keywords: Localization Ancestry Plot

### ** Examples


#this example not run because it takes a little longer than 5 secs
#note - type example(FunctionName, run.dontrun=TRUE) to run the example where FunctionName is
#the name of the function
## Not run: 
##D 	#Data generation
##D 	SampleSites=10
##D 	NumberLoci=4
##D 	MaxAlleles=4
##D 	NumberAllelesAtEachLocus=sample(2:MaxAlleles,NumberLoci,replace=TRUE)
##D 
##D 	TestData=array(0,dim=c(MaxAlleles,SampleSites,NumberLoci))
##D 	for(i in 1:NumberLoci){
##D 		for(j in 1:NumberAllelesAtEachLocus[i]){
##D 			TestData[j,,i]=sample(1:10,SampleSites,replace=TRUE)
##D 		}
##D 	}
##D 	#Europe is about -9 to 38 and 34 to 60
##D 	TestCoordinates=array(0,dim=c(SampleSites,2))
##D 	TestCoordinates[,1]=runif(SampleSites,-9,38)
##D 	TestCoordinates[,2]=runif(SampleSites,34,60)
##D 
##D 	#Fitting the model
##D 	#MaxGridLength is the maximum number of boxes allowed to span the region in either direction
##D 	#RhoParameter is a tuning constant
##D 	trials2=FitMultinomialModel(TestData,TestCoordinates,MaxGridLength=20,RhoParameter=10)
##D 	str(trials2)
##D 
##D 	#Plotting the model
##D 	PlotAlleleFrequencySurface(trials2)
##D 	
## End(Not run)




