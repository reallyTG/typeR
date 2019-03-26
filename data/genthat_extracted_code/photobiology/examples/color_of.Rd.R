library(photobiology)


### Name: color_of
### Title: Color of an object
### Aliases: color_of color_of.default color_of.numeric color_of.list
###   color_of.waveband color_of.source_spct color_of.source_mspct
###   colour_of color

### ** Examples

wavelengths <- c(300, 420, 500, 600, NA) # nanometres
color_of(wavelengths)
color_of(waveband(c(300,400)))
color_of(list(blue = waveband(c(400,480)), red = waveband(c(600,700))))
color_of(numeric())
color_of(NA_real_)

color_of(sun.spct)





