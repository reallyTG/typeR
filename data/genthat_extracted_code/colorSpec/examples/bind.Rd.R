library(colorSpec)


### Name: bind
### Title: Combine colorSpec Objects
### Aliases: bind bind.colorSpec
### Keywords: colorSpec

### ** Examples

Rosco = readSpectra( system.file( 'extdata/objects/Rosco.txt', package='colorSpec' ) )
Rosco = resample( Rosco, wave=wavelength(Hoya) )
numSpectra(Hoya)        # prints 4
numSpectra(Rosco)       # prints 42

filters = bind( Hoya, Rosco )
numSpectra(filters)     # prints 46

colnames( extradata(Hoya) )
## [1] "SAMPLE_NAME"  "FresnelReflectance"  "Thickness"

colnames( extradata(Rosco) )
## [1] "Model"  "SampleID"  "SAMPLE_NAME"  "Substrate"  "RefractiveIndex"  "Thickness"

##  The columns in common are "SAMPLE_NAME" and "Thickness"


colnames( extradata(filters) )
## [1] "FresnelReflectance" "Model" "RefractiveIndex" "SAMPLE_NAME"
## [5] "SampleID" "Substrate" "Thickness"
##
## "SAMPLE_NAME" and "Thickness" are combined in the usual way
## The other columns are present, and missing data is filled with NAs



