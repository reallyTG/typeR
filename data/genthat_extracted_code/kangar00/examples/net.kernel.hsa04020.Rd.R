library(kangar00)


### Name: net.kernel.hsa04020
### Title: Example network-based kernel matrix for pathway hsa04020.
### Aliases: net.kernel.hsa04020
### Keywords: datasets

### ** Examples

data(net.kernel.hsa04020)
# derivation 
data(gwas)
data(hsa04020)
net_kernel <- calc_kernel(gwas, hsa04020, knots=NULL, type='net', calculation='cpu')
# are the value differences smaller than machine epsilon?
all(abs(net.kernel.hsa04020@kernel - net_kernel@kernel) < sqrt(.Machine$double.eps))




