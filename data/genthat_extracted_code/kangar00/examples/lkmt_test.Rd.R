library(kangar00)


### Name: lkmt_test
### Title: A function to calculate the p-values for kernel matrices.
### Aliases: lkmt_test score_test,matrix-method davies_test,matrix-method

### ** Examples

data(hsa04020)
data(gwas)
net_kernel <- calc_kernel(gwas, hsa04020, knots=NULL, type='net', calculation='cpu')
lkmt_test(pheno ~ sex + age, net_kernel, gwas, method='satt')



