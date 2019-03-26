library(kangar00)


### Name: kernel-class
### Title: An S4 class representing a kernel matrix calculated for a
###   pathway
### Aliases: kernel-class kernel show,kernel-method summary,kernel-method
###   summary,kernel,ANY-method plot,kernel,missing-method
###   plot,kernel,ANY-method

### ** Examples

data(gwas)
data(hsa04020)
net_kernel <- calc_kernel(gwas, hsa04020, knots=NULL, type='net', calculation='cpu')

show(net_kernel)
summary(net_kernel)
plot(net_kernel, hclust=TRUE)




