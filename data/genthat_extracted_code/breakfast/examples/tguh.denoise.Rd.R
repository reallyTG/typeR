library(breakfast)


### Name: tguh.denoise
### Title: Noise removal from Tail-Greedy Unbalanced Haar coefficients via
###   connected thresholding
### Aliases: tguh.denoise

### ** Examples

rnoise <- rnorm(10)
rnoise.tguh <- tguh.decomp(rnoise)
print(rnoise.tguh)
rnoise.denoise <- tguh.denoise(rnoise.tguh, 3)
rnoise.clean <- tguh.reconstr(rnoise.denoise)
print(rnoise.clean)



