library(PPCI)


### Name: mddc
### Title: Divisive Clustering Using Minimum Density Hyperplanes
### Aliases: mddc
### Keywords: file

### ** Examples

## load dermatology dataset
data(dermatology)

## obtain a clustering solution using minimum density hyperplanes
sol <- mddc(dermatology$x, 6)

## evaluate the solution using external cluster validity metrics
cluster_performance(sol$cluster, dermatology$c)



