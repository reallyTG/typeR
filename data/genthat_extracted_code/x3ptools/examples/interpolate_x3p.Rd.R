library(x3ptools)


### Name: interpolate_x3p
### Title: Interpolate from an x3p object
### Aliases: interpolate_x3p

### ** Examples

logo <- read_x3p(system.file("csafe-logo.x3p", package="x3ptools"))
# resolution:
logo$header.info$incrementX
# change resolution to 1 micron = 1e-6 meters
logo2 <- interpolate_x3p(logo, resx = 1e-6)
logo2$header.info$incrementX



