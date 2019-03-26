library(colorSpec)


### Name: chop
### Title: chop spectra into low and high parts
### Aliases: chop chop.colorSpec
### Keywords: colorSpec

### ** Examples

# chop blue butane flame into diatomic carbon and hydrocarbon parts
path = system.file( "extdata/sources/BlueFlame.txt", package="colorSpec" )
blueflame = readSpectra( path, seq(375,650,0.5) )
plot( chop( blueflame, interval=c(432,435), adj=0.8 ) )

# chop 'white' LED into blue and yellow parts
path = system.file( "extdata/sources/Gepe-G-2001-LED.sp", package="colorSpec" )
LED = readSpectra( path )
plot( chop( LED, c(470,495) ) )



