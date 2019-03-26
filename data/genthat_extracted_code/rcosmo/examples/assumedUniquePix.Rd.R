library(rcosmo)


### Name: assumedUniquePix
### Title: Check if object was assumed to have unique HEALPix indices
### Aliases: assumedUniquePix

### ** Examples


hp1 <- HPDataFrame(I=rnorm(5), nside = 1, spix = c(1,1,2,2,3))
pix(hp1)
coords(hp1, new.coords = "cartesian")
assumedUniquePix(hp1)

sky <- CMBDataFrame(nside = 32, coords = "cartesian", ordering = "nested")
sky.s <- CMBDataFrame(sky, sample.size = 100)
hpdf <- HPDataFrame(sky.s, auto.spix = TRUE)
assumedUniquePix(hpdf)




