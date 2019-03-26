library(kangar00)


### Name: lkmt.net.kernel.hsa04020
### Title: Example test result for the network-based 'kernel' for 'pathway'
###   hsa04020.
### Aliases: lkmt.net.kernel.hsa04020
### Keywords: datasets

### ** Examples

data(hsa04020)
data(gwas)
net_kernel <- calc_kernel(gwas, hsa04020, knots=NULL, type='net', calculation='cpu')
lkmt_test(pheno ~ sex + age, net_kernel, gwas, method='satt')



