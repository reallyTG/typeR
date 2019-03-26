library(POT)


### Name: gpd2frech
### Title: Transforms GPD Observations to Unit Frechet Ones and Vice Versa
### Aliases: gpd2frech frech2gpd
### Keywords: manip

### ** Examples

x <- rgpd(10, 0, 1, 0.25)
z <- gpd2frech(x, 0, 1, 0.25)
z
all(frech2gpd(z, 0, 1, 0.25) == x)



