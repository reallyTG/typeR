library(imager)


### Name: blur_anisotropic
### Title: Blur image anisotropically, in an edge-preserving way.
### Aliases: blur_anisotropic

### ** Examples

im <- load.image(system.file('extdata/Leonardo_Birds.jpg',package='imager'))
im.noisy <- (im + 80*rnorm(prod(dim(im)))) 
blur_anisotropic(im.noisy,ampl=1e4,sharp=1) %>% plot



