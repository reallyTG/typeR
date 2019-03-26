library(OriGen)


### Name: ConvertPEDData
### Title: Plink PED file conversion
### Aliases: ConvertPEDData
### Keywords: Conversion Plink Files PED

### ** Examples


#Note that Plink files "10SNPs.ped", "10SNPs.map" and also "Locations.txt" 
#are included in the data folder of the OriGen package with ".txt" appended to the Plink files.
#Please remove ".txt" and navigate to the appropriate location   
#before testing the following commands.
#Note that this was done to allow inclusion of the test data in the package.

## Not run: trials=ConvertPEDData("10SNPs","Locations.txt")
## Not run: str(trials)
MaxGridLength=20
RhoParameter=10
## Not run: 
##D trials2=FitOriGenModel(trials$DataArray,trials$SampleCoordinates,
##D 	MaxGridLength,RhoParameter)
## End(Not run)
## Not run: PlotAlleleFrequencySurface(trials2)




