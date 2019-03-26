library(TeachingSampling)


### Name: IkWR
### Title: Sample Membership Indicator for with Replacements sampling
###   designs
### Aliases: IkWR
### Keywords: survey

### ** Examples

# Vector U contains the label of a population of size N=5
U <- c("Yves", "Ken", "Erik", "Sharon", "Leslie")
N <- length(U)
m <- 2
# The sample membership matrix for fixed size without replacement sampling designs
IkWR(N,m)



