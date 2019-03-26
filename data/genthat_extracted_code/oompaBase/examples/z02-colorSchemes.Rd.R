library(oompaBase)


### Name: colorschemes
### Title: Color Schemes for Images and Heat Maps
### Aliases: redscale greenscale bluescale blueyellow cyanyellow redgreen
###   jetColors grayscale greyscale
### Keywords: color

### ** Examples

data <- matrix(1:1024, nrow=1024)
image(data, col=bluescale(64))
image(data, col=redgreen(32))
image(data, col=redscale(128))
image(data, col=blueyellow(64))
image(data, col=jetColors(64))
image(data, col=grayscale(64))
image(data, col=cyanyellow(64))
rm(data) # cleanup



