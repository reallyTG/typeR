library(kangar00)


### Name: lkmt-class
### Title: An S4 class to represent the variance component test.
### Aliases: lkmt-class lkmt show,lkmt-method show,GWASdata,ANY-method
###   summary,lkmt-method summary,GWASdata,ANY-method

### ** Examples

data(hsa04020)
data(gwas)
# compute kernel
net_kernel <- calc_kernel(gwas, hsa04020, knots=NULL, type='net', calculation='cpu')
# perform LKMT 
res <- lkmt_test(pheno ~ sex + age, net_kernel, gwas, method='satt')
# show and summary methods
show(res)
summary(res)
# summary method
summary(lkmt.net.kernel.hsa04020)



