library(LS2Wstat)


### Name: mix2images
### Title: Insert one image into another.
### Aliases: mix2images
### Keywords: manip

### ** Examples


# Generate 2 images.
#
ImageA <- matrix(rnorm(256^2), nrow=256, ncol=256)
ImageB <- matrix(rnorm(256^2, sd=2.8), nrow=256, ncol=256)
#
# Insert Image A into Image B at a proportion of 0.25
#
MixImaImb <- mix2images(ImageA, ImageB, prop=0.25, pos="e")
#



