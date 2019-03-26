library(photobiology)


### Name: absorbance
### Title: Absorbance
### Aliases: absorbance absorbance.default absorbance.filter_spct
###   absorbance.object_spct absorbance.filter_mspct
###   absorbance.object_mspct

### ** Examples

absorbance(polyester.spct, new_waveband(400,700))
absorbance(yellow_gel.spct, new_waveband(400,700))
absorbance(yellow_gel.spct, split_bands(c(400,700), length.out = 3))
absorbance(yellow_gel.spct, split_bands(c(400,700), length.out = 3),
        quantity = "average")
absorbance(yellow_gel.spct, split_bands(c(400,700), length.out = 3),
        quantity = "total")
absorbance(yellow_gel.spct, split_bands(c(400,700), length.out = 3),
        quantity = "relative")
absorbance(yellow_gel.spct, split_bands(c(400,700), length.out = 3),
        quantity = "relative.pc")
absorbance(yellow_gel.spct, split_bands(c(400,700), length.out = 3),
        quantity = "contribution")
absorbance(yellow_gel.spct, split_bands(c(400,700), length.out = 3),
        quantity = "contribution.pc")




