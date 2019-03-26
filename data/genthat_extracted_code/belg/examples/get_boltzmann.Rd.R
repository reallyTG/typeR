library(belg)


### Name: get_boltzmann
### Title: Boltzmann entropy of a landscape gradient
### Aliases: get_boltzmann get_boltzmann get_boltzmann.default
###   get_boltzmann get_boltzmann.array get_boltzmann
###   get_boltzmann.RasterLayer get_boltzmann get_boltzmann.RasterStack
###   get_boltzmann get_boltzmann.RasterBrick

### ** Examples

new_c = c(56, 86, 98, 50, 45, 56, 96, 25,
          15, 55, 85, 69, 12, 52, 25, 56,
          32, 25, 68, 98, 58, 66, 56, 58)

lg = matrix(new_c, nrow = 3, ncol = 8, byrow = TRUE)
get_boltzmann(lg, relative = FALSE, base = "log10")
get_boltzmann(lg, relative = TRUE, base = "log2")
get_boltzmann(lg, relative = TRUE, base = "log")




