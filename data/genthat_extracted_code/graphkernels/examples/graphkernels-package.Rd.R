library(graphkernels)


### Name: graphkernels-package
### Title: Graph Kernels
### Aliases: graphkernels-package graphkernels
### Keywords: graph kernel

### ** Examples

data(mutag)
KEH <- CalculateEdgeHistKernel(mutag)
  ## compute linear kernel between edge histograms
KWL <- CalculateWLKernel(mutag, 5)
  ## compute Weisfeiler-Lehman subtree kernel



