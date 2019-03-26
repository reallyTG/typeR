library(synchrony)


### Name: community.sync
### Title: Compute community-wide synchrony and its significance via Monte
###   Carlo randomizations
### Aliases: community.sync

### ** Examples

# Community matrix for 20 species undergoing random fluctuations 
comm.rand=matrix(runif(100), nrow=5, ncol=20)
community.sync(comm.rand, nrands=20)$pval
# Community matrix for 20 species undergoing synchronized fluctuations 
comm.corr=matrix(rep(comm.rand[,1], 20), nrow=5, ncol=20)
community.sync(comm.corr, nrands=20)$pval
# On "real" data
data(bird.traits)
community.sync(bird.traits, nrands=20)$pval



