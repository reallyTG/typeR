library(displayHTS)


### Name: imageIntensity.fn
### Title: Plate Intensity Image
### Aliases: imageIntensity.fn

### ** Examples

   data(HTSdataSort)
   par( mfrow=c(4, 3) )
   imageIntensity.fn(data.df=HTSdataSort, intensityName="log2Intensity",
                      plateName="BARCODE", wellName="WELL_USAGE",
                      rowName="XPOS", colName="YPOS", 
                      sampleName="Sample", sourcePlateName="SOBARCODE" )



