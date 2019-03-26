library(colorSpec)


### Name: resample
### Title: resample a colorSpec Object to new wavelengths
### Aliases: resample resample.colorSpec
### Keywords: colorSpec

### ** Examples

path = system.file( "extdata/sources/pos1-20x.scope", package='colorSpec' )
y = readSpectra( path )
# plot noisy data in gray
plot( y, col='gray' )
# plot smoothed plot in black on top of the noisy one to check quality
plot( resample( y, 200:880, meth='loess', span=0.02 ), col='black', add=TRUE )



