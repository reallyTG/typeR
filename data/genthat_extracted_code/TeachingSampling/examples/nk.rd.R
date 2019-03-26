library(TeachingSampling)


### Name: nk
### Title: Sample Selection Indicator for With Replacement Sampling Designs
### Aliases: nk
### Keywords: survey

### ** Examples

# Vector U contains the label of a population of size N=5
U <- c("Yves", "Ken", "Erik", "Sharon", "Leslie")
N <- length(U)
m <- 2
# The sample membership matrix for fixed size without replacement sampling designs
nk(N,m)



