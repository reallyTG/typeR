library(TeachingSampling)


### Name: IkRS
### Title: Sample Membership Indicator for Random Size sampling designs
### Aliases: IkRS
### Keywords: survey

### ** Examples

# Vector U contains the label of a population of size N=5
U <- c("Yves", "Ken", "Erik", "Sharon", "Leslie")
N <- length(U)
n <- 3
# The sample membership matrix for fixed size without replacement sampling designs
IkRS(N)
# The first sample is a null one and the last sample is a census



