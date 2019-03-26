library(synchrony)


### Name: meancorr
### Title: Compute mean column-wise correlation and determine its
###   significance via Monte Carlo randomizations
### Aliases: meancorr

### ** Examples

# Community matrix for 20 species undergoing random fluctuations 
comm.rand=matrix(runif(100), nrow=5, ncol=20)
meancorr(comm.rand, nrands=20)$pval
# Community matrix for 20 species undergoing synchronized fluctuations 
comm.corr=matrix(rep(comm.rand[,1], 20), nrow=5, ncol=20)
meancorr(comm.corr, nrands=20)$pval
# On "real" data
data(bird.traits)
meancorr(bird.traits, nrands=20)$pval



