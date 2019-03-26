library(photobiology)


### Name: s_e_irrad2rgb
### Title: Spectral irradiance to rgb color conversion
### Aliases: s_e_irrad2rgb

### ** Examples

my.color <-
    with(sun.data, s_e_irrad2rgb(w.length, s.e.irrad, color.name="sunWhite"))
col2rgb(my.color)




