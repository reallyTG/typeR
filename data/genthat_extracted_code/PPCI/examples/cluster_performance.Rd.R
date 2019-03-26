library(PPCI)


### Name: cluster_performance
### Title: External Cluster Validity Metrics
### Aliases: cluster_performance
### Keywords: file

### ** Examples

## load dermatology dataset
data(dermatology)

## obtain clustering solution using MCDC
sol <- mcdc(dermatology$x, 6)

## evaluate solution using external cluster validity measures
cluster_performance(sol$cluster, dermatology$c)



