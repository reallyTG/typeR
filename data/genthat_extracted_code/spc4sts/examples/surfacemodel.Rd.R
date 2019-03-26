library(spc4sts)


### Name: surfacemodel
### Title: Statistical reprentations of stochastic textured surfaces using
###   supervised learning.
### Aliases: surfacemodel print.surfacemodel

### ** Examples

## fit a model to characterize the surface of a simulated image:
img <- sarGen(m = 100, n = 100, border = 50) # training image
model <- surfacemodel(img, nb = 1) # see Note above for how to select nb
model$R2cv

## change the raster scan order from left-to-right then top-to-bottom to
## left-to-right then bottom-to-top, and re-fit the model
## (see the Note section above)
img2  <- as.matrix(t(apply(img , 2, rev)))
model2 <- surfacemodel(img2, nb = 1)
model2$R2cv # expected to be smaller than model$R2cv



