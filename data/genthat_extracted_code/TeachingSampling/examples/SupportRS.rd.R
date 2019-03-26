library(TeachingSampling)


### Name: SupportRS
### Title: Sampling Support for Random Size Without Replacement Sampling
###   Designs
### Aliases: SupportRS
### Keywords: survey

### ** Examples

# Vector U contains the label of a population
U <- c("Yves", "Ken", "Erik", "Sharon", "Leslie")
N <- length(U)
# The support for fixed size without replacement sampling designs
# Under this context, there are ten (10) possibles samples
SupportRS(N)
# The same support, but labeled
SupportRS(N, ID=U)
# y is the variable of interest
y<-c(32,34,46,89,35)
# The following output is very useful when checking 
# the design-unbiasedness of an estimator
SupportRS(N, ID=y)



