library(graphkernels)


### Name: CalculateKernelCpp
### Title: An C++ implementation of graph kernels
### Aliases: CalculateKernelCpp
### Keywords: graph kernel

### ** Examples

data(mutag)
graph.info.list <- vector("list", length(mutag))
for (i in 1:length(mutag)) { graph.info.list[[i]] <- GetGraphInfo(mutag[[i]]) }
K <- CalculateKernelCpp(graph.info.list, 5, 11)



