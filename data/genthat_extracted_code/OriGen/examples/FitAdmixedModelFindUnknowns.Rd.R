library(OriGen)


### Name: FitAdmixedModelFindUnknowns
### Title: Fit the OriGen model and place unknown individuals who may be
###   admixed
### Aliases: FitAdmixedModelFindUnknowns
### Keywords: Localization Ancestry Admixture

### ** Examples


#this example not run because it takes longer than 5 secs
#note - type example(FunctionName, run.dontrun=TRUE) to run the example where FunctionName is
#the name of the function
## Not run: 
##D 
##D 	#Data generation
##D 	SampleSites=10
##D 	NumberSNPs=4
##D 	TestData=array(sample(2*(1:30),2*SampleSites*NumberSNPs,replace=TRUE),
##D 		dim=c(2,SampleSites,NumberSNPs))
##D 	#Europe is about -9 to 38 and 34 to 60
##D 	TestCoordinates=array(0,dim=c(SampleSites,2))
##D 	TestCoordinates[,1]=runif(SampleSites,-9,38)
##D 	TestCoordinates[,2]=runif(SampleSites,34,60)
##D 
##D 	#This code simulates the number of major alleles the unknown individuals have.
##D 	NumberUnknowns=2
##D 	TestUnknowns=array(sample(0:2,NumberUnknowns*NumberSNPs,replace=TRUE),
##D 		dim=c(NumberUnknowns,NumberSNPs))
##D 
##D 	#Fitting the admixed model
##D 	#MaxGridLength is the maximum number of boxes allowed to span the region in either direction
##D 	#Note that MaxGridLength is reduced here to allow the example to run in less than 5 secs
##D 	#RhoParameter is a tuning constant
##D 	print("MaxGridLength is intentionally set really low for fast examples.
##D 		Meaningful results will most likely require a higher value.")
##D 	trials6=FitAdmixedModelFindUnknowns(TestData,TestCoordinates,
##D 		TestUnknowns,MaxGridLength=8,RhoParameter=10)
##D 
##D 	#Plots the admixed surface disregarding fractions less than 0.01
##D 	PlotAdmixedSurface(trials6)
##D 	
## End(Not run)



