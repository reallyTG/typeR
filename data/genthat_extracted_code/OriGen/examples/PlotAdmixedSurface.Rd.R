library(OriGen)


### Name: PlotAdmixedSurface
### Title: Plots admixture fraction results
### Aliases: PlotAdmixedSurface
### Keywords: Localization Ancestry Plot Admixture

### ** Examples


#this example not run because it takes longer than 5 secs
#note - type example(FunctionName, run.dontrun=TRUE) to run the example where FunctionName is
#the name of the function

## Not run: 
##D 
##D ##Data generation
##D SampleSites=10
##D NumberSNPs=4
##D TestData=array(sample(2*(1:30),2*SampleSites*NumberSNPs,replace=TRUE),
##D 	dim=c(2,SampleSites,NumberSNPs))
##D ##This data is simulated in Europe which is around Longitude -9 to 38 and Latitude 34 to 60
##D TestCoordinates=array(0,dim=c(SampleSites,2))
##D TestCoordinates[,1]=runif(SampleSites,-9,38)
##D TestCoordinates[,2]=runif(SampleSites,34,60)
##D 
##D ##This code simulates the number of major alleles the unknown individuals have.
##D NumberUnknowns=2
##D TestUnknowns=array(sample(0:2,NumberUnknowns*NumberSNPs,
##D 	replace=TRUE),dim=c(NumberUnknowns,NumberSNPs))
##D 
##D ##MaxGridLength is the maximum number of boxes allowed 
##D ##to span the region in either direction
##D ##Note that this number was reduced to allow the example to run in less than 5 secs
##D ##RhoParameter is a tuning constant
##D print("MaxGridLength is intentionally set really low for fast examples. 
##D 	Meaningful results will most likely require a higher value.")
##D 
##D ##Fitting the admixed model
##D ##Note that MaxGridLength is intentionally set unusably low so that the example
##D ##runs in under 5 seconds.  The default value of 20 is more reasonable in general
##D AdmixedTrials=FitAdmixedModelFindUnknowns(TestData,TestCoordinates,
##D 	TestUnknowns,MaxGridLength=8,RhoParameter=10)
##D ##Plots the admixed surface disregarding fractions less than 0.01
##D PlotAdmixedSurface(AdmixedTrials,UnknownNumber=1)
##D 
## End(Not run)




