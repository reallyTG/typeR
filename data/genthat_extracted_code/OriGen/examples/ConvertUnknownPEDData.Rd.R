library(OriGen)


### Name: ConvertUnknownPEDData
### Title: Plink PED file conversion for known and unknown data
### Aliases: ConvertUnknownPEDData
### Keywords: Conversion Plink Files PED

### ** Examples


#Note that Plink files "10SNPs.ped", "10SNPs.map" and also "Locations.txt" 
#are included in the data folder of the OriGen package with ".txt" appended to the Plink files.
#Please remove ".txt" and navigate to the appropriate location   
#before testing the following commands.
#Note that this was done to allow inclusion of the test data in the package.

## Not run: trials3=ConvertUnknownPEDData("10SNPs","Locations.txt",""10SNPs"")
## Not run: str(trials3)
MaxGridLength=30
RhoParameter=10
## Not run: 
##D trials4=FitOriGenModelFindUnknowns(trials3$DataArray,trials3$SampleCoordinates,
##D 	trials3$UnknownData[1:2,],MaxGridLength,RhoParameter)
## End(Not run)
## Not run: PlotUnknownHeatMap(trials4,UnknownNumber=1,MaskWater=TRUE)




