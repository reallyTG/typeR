library(colorSpec)


### Name: applyspec
### Title: apply a function to each spectrum in a colorSpec object
### Aliases: applyspec.colorSpec applyspec
### Keywords: colorSpec

### ** Examples

#  convert absorbance to transmittance
path = system.file( "extdata/stains/Hematoxylin.txt", package='colorSpec' )
x = readSpectra( path )
x = applyspec( x, function(y) {10^(-y)} ) # this is what linearize(x) does



