library(clue)


### Name: cl_ultrametric
### Title: Ultrametrics of Hierarchies
### Aliases: cl_ultrametric as.cl_ultrametric
### Keywords: cluster

### ** Examples

hc <- hclust(dist(USArrests))
u <- cl_ultrametric(hc)
## Subscripting.
u[1 : 5, 1 : 5]
u[1 : 5, 6 : 7]
## Plotting.
plot(u)



