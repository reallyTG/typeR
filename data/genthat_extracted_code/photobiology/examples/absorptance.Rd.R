library(photobiology)


### Name: absorptance
### Title: Absorptance
### Aliases: absorptance absorptance.default absorptance.filter_spct
###   absorptance.object_spct absorptance.filter_mspct
###   absorptance.object_mspct

### ** Examples

absorptance(black_body.spct, new_waveband(400,500))
absorptance(white_body.spct, new_waveband(300,400))
absorptance(black_body.spct, split_bands(c(400,700), length.out = 3))
absorptance(black_body.spct, split_bands(c(400,700), length.out = 3),
        quantity = "average")
absorptance(black_body.spct, split_bands(c(400,700), length.out = 3),
        quantity = "total")
absorptance(black_body.spct, split_bands(c(400,700), length.out = 3),
        quantity = "relative")
absorptance(black_body.spct, split_bands(c(400,700), length.out = 3),
        quantity = "relative.pc")
absorptance(black_body.spct, split_bands(c(400,700), length.out = 3),
        quantity = "contribution")
absorptance(black_body.spct, split_bands(c(400,700), length.out = 3),
        quantity = "contribution.pc")




