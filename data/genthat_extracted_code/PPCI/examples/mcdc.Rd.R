library(PPCI)


### Name: mcdc
### Title: Divisive Clustering Using Maximum Clusterability
### Aliases: mcdc
### Keywords: file

### ** Examples

## load the dermatology dataset
data(dermatology)

## obtain a clustering solution using MCDC
sol <- mcdc(dermatology$x, 6)

## evaluate the performance of the solution using external cluster validity metrics
cluster_performance(sol$cluster, dermatology$c)




