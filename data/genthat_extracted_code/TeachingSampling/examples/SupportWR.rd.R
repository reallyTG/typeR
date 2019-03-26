library(TeachingSampling)


### Name: SupportWR
### Title: Sampling Support for Fixed Size With Replacement Sampling
###   Designs
### Aliases: SupportWR
### Keywords: survey

### ** Examples

# Vector U contains the label of a population
U <- c("Yves", "Ken", "Erik", "Sharon", "Leslie")
N <- length(U)
m <- 2
# The support for fixed size without replacement sampling designs
# Under this context, there are ten (10) possibles samples
SupportWR(N, m)
# The same support, but labeled
SupportWR(N, m, ID=U)
# y is the variable of interest
y<-c(32,34,46,89,35)
# The following output is very useful when checking 
# the design-unbiasedness of an estimator
SupportWR(N, m, ID=y)



