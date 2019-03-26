library(colorSpec)


### Name: product
### Title: Compute the product of colorSpec objects
### Aliases: product product.colorSpec
### Keywords: colorSpec

### ** Examples

#  sequence 1.
path = system.file( "extdata/objects/Midwest-SP700-2014.txt", package='colorSpec' )
blocker.IR = readSpectra( path )
product( blocker.IR, Hoya, wave='auto' )


#  sequence 2.
product( subset(solar.irradiance,1), atmosphere2003, blocker.IR, Hoya, wave='auto' )


#  sequence 3.
plumbicon = readSpectra( system.file( "extdata/cameras/plumbicon30mm.txt", package='colorSpec' ) )
product( blocker.IR, subset(Hoya,1:3), plumbicon, wave='auto' )


#   sequence 4.
#   make an RGB scanner
bluebalancer = subset(Hoya,'LB')
# combine tungsten light source A.1nm with blue light-balance filter
# use the string 'artwork' to mark the variable material slot
scanner = product( A.1nm, bluebalancer, 'artwork', Flea2.RGB, wave='auto' )


#  sequence 5.
product( D65.1nm, Flea2.RGB )  # a 1x3 matrix, no materials
product( D65.1nm, neutralMaterial(0.01), Flea2.RGB, wave='auto' ) # a 1x3 matrix, 1 material
path = system.file( "extdata/sources/Lumencor-SpectraX.txt", package='colorSpec' )
lumencor = readSpectra( path, wave=340:660 )
product( lumencor, Flea2.RGB, wave='auto' )   # a 7x3 matrix, no materials


#  sequence 6.
scanner = calibrate( scanner )
target = readSpectra( system.file( "extdata/targets/N130501.txt", package='colorSpec') )
product( target, scanner, wave='auto' )  #  a 288x3 matrix




