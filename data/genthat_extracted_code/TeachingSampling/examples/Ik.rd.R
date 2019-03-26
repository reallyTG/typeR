library(TeachingSampling)


### Name: Ik
### Title: Sample Membership Indicator
### Aliases: Ik
### Keywords: survey

### ** Examples

# Vector U contains the label of a population of size N=5
U <- c("Yves", "Ken", "Erik", "Sharon", "Leslie")
N <- length(U)
n <- 2
# The sample membership matrix for fixed size without replacement sampling designs
Ik(N,n)
# The first unit, Yves, belongs to the first four possible samples 



