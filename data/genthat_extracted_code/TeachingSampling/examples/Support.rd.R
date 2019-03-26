library(TeachingSampling)


### Name: Support
### Title: Sampling Support for Fixed Size Without Replacement Sampling
###   Designs
### Aliases: Support
### Keywords: survey

### ** Examples

# Vector U contains the label of a population
U <- c("Yves", "Ken", "Erik", "Sharon", "Leslie")
N <- length(U)
n <- 2
# The support for fixed size without replacement sampling designs
# Under this context, there are ten (10) possibles samples
Support(N,n)
# The same support, but labeled
Support(N,n,ID=U)
# y is the variable of interest
y<-c(32,34,46,89,35)
# The following output is very useful when checking 
# the design-unbiasedness of an estimator
Support(N,n,ID=y)



