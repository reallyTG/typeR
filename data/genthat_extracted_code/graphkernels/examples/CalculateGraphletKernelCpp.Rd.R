library(graphkernels)


### Name: CalculateGraphletKernelCpp
### Title: An C++ implementation of graphlet kernels
### Aliases: CalculateGraphletKernelCpp
### Keywords: graph kernel graphlet

### ** Examples

data(mutag)
al.list <- as.list(rep(NA, length(mutag)))
for (i in 1:length(mutag)) { al.list[[i]] <- as_adj_list(mutag[[i]]) }
K <- CalculateGraphletKernelCpp(list(), al.list, 4, 0)



