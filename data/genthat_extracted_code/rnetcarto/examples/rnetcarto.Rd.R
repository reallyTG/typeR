library(rnetcarto)


### Name: rnetcarto
### Title: Computes modularity and modularity roles from a network.
### Aliases: netcarto rnetcarto rnetcarto-package

### ** Examples

# Generate a simple random network
a = matrix(as.integer(runif(100)<.3), ncol=10)
a[lower.tri(a)] = 0
# Find an optimal partition for modularity using netcarto.
netcarto(a)



