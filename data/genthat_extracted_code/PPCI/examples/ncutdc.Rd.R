library(PPCI)


### Name: ncutdc
### Title: Divisive Clustering Using Minimum Normalised Cut Hyperplanes
### Aliases: ncutdc
### Keywords: file

### ** Examples

## load dermatology dataset
data(dermatology)

## obtain clustering solution
sol <- ncutdc(dermatology$x, 6)

## evaluate solution using external cluster validity metrics
cluster_performance(sol$cluster, dermatology$c)



