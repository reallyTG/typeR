library(colorSpec)


### Name: Flea2.RGB
### Title: Flea2 Camera FL2-14S3C from Point Grey
### Aliases: Flea2.RGB Flea2
### Keywords: datasets cameras

### ** Examples

#  Make a scanner from a tungsten source and a Flea2 camera
Flea2.scanner = product( A.1nm, "VARMATERIAL", Flea2.RGB, wavelength=420:680 )
Flea2.scanner = calibrate( Flea2.scanner )



