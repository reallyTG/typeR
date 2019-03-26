library(photobiology)


### Name: split_bands
### Title: List-of-wavebands constructor
### Aliases: split_bands

### ** Examples

split_bands(c(400,500,600))
split_bands(list(c(400,500),c(550,650)))
split_bands(list(A=c(400,500),B=c(550,650)))
split_bands(c(400,500,600), short.names=FALSE)
split_bands(c(400,500,600), list.names=c("a","b"))
split_bands(c(400,700), length.out=6)
split_bands(400:700, length.out=3)
split_bands(sun.spct, length.out=10)
split_bands(waveband(c(400,700)), length.out=5)




