library(BosonSampling)


### Name: bosonSampler
### Title: Function for independently sampling from the Boson Sampling
###   distribution
### Aliases: bosonSampler

### ** Examples

set.seed(7)
n <- 20  # number of photons
m <- 200 # number of output modes
A <- randomUnitary(m)[,1:n]
# sample of output vectors
valueList <- bosonSampler(A, sampleSize = 10)$values 
valueList
# sample of output multisets 
apply(valueList,1, sort) 
#
set.seed(7)
n <- 12  # number of photons
m <- 30 # number of output modes
A <- randomUnitary(m)[,1:n]
# sample of output vectors
valueList = bosonSampler(A, sampleSize = 1000)$values 
# Compare frequency of output modes at different
# positions in the output vectors 
matplot(1:m,apply(valueList,1,tabulate), pch =20, t = "p", 
xlab = "output modes", ylab = "frequency")



