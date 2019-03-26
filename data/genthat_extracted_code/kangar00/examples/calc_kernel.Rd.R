library(kangar00)


### Name: calc_kernel
### Title: Calculate the kernel-matrix for a pathway
### Aliases: calc_kernel calc_kernel,GWASdata-method
###   lin_kernel,GWASdata-method lin_kernel sia_kernel,GWASdata-method
###   sia_kernel net_kernel,GWASdata-method net_kernel

### ** Examples

data(gwas)
data(hsa04020)
lin_kernel <- calc_kernel(gwas, hsa04020, knots=NULL, type='lin', calculation='cpu')
summary(lin_kernel)
net_kernel <- calc_kernel(gwas, hsa04020, knots=NULL, type='net', calculation='cpu')
summary(net_kernel)




