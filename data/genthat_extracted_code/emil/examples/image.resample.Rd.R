library(emil)


### Name: image.resample
### Title: Visualize resampling scheme
### Aliases: image.resample image.crossvalidation

### ** Examples

y <- gl(2, 30)
image(resample("crossvalidation", y, nfold=3, nrepeat=8), col=y)



