library(bivariate)


### Name: kernel
### Title: Kernel Distributions
### Aliases: kbvpdf kbvcdf

### ** Examples

#construct some kernel distributions
#(based on example in KernSmooth package)
data ("geyser", package="MASS")
kbvpdf.f = kbvpdf (geyser$duration, geyser$waiting, 0.7, 7)
kbvcdf.f = kbvcdf (geyser$duration, geyser$waiting, 0.7, 7)



