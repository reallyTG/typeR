library(sperrorest)


### Name: represampling_factor_bootstrap
### Title: Bootstrap at an aggregated level
### Aliases: represampling_factor_bootstrap

### ** Examples

data(ecuador)
# a dummy example for demonstration, performing bootstrap
# at the level of an arbitrary factor variable:
parti <- represampling_factor_bootstrap(ecuador,
                                       factor(floor(ecuador$dem / 100)),
                                       oob = TRUE)
# plot(parti,ecuador)
# using the factor bootstrap for a non-overlapping block bootstrap
# (see also represampling_tile_bootstrap):
fac <- partition_tiles(ecuador, return_factor = TRUE, repetition = c(1:3),
                       dsplit = 500, min_n = 200, rotation = 'random',
                       offset = 'random')
parti <- represampling_factor_bootstrap(ecuador, fac, oob = TRUE,
repetition = c(1:3))
# plot(parti, ecuador)




