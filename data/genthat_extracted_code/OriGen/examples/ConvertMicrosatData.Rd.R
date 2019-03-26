library(OriGen)


### Name: ConvertMicrosatData
### Title: Microsatellite file conversion for known and unknown data
### Aliases: ConvertMicrosatData
### Keywords: Conversion Plink Files PED

### ** Examples


#Note that sample files MicrosatTrialDataSmall.txt and 
#LocationTrialDataSmall.txt are included in data for formatting.
#Note that this was done to allow inclusion of the test data in the package.

## Not run: 
##D MicrosatDataSmall=ConvertMicrosatData("MicrosatTrialDataSmall.txt",
##D 		"LocationTrialDataSmall.txt")
## End(Not run)
## Not run: str(MicrosatDataSmall)
## Not run: 
##D MicrosatAnalysisSmall=FitMultinomialModel(MicrosatDataSmall$DataArray,
##D 		MicrosatDataSmall$SampleCoordinates,MaxGridLength=20)
## End(Not run)
## Not run: str(MicrosatAnalysisSmall)
## Not run: PlotAlleleFrequencySurface(MicrosatAnalysisSmall)





