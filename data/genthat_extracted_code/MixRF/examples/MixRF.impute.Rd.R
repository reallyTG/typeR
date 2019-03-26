library(MixRF)


### Name: MixRF.impute
### Title: Impute a large number of genes using the MixRF algorithm with
###   parallel computing
### Aliases: MixRF.impute

### ** Examples

## Not run: 
##D data(sim)
##D 
##D idx.selected.gene.iPC = which(sapply(sim$eqtl.lis, length) >= 1)
##D 
##D Yimp = MixRF.impute(sim$Ydat, sim$eqtl.lis, sim$snp.dat, sim$cov, iPC = TRUE, 
##D     idx.selected.gene.iPC, parallel.size = 4)
## End(Not run)




