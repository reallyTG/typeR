library(synchrony)


### Name: synchrony-package
### Title: Methods for Computing Spatial, Temporal, and Spatiotemporal
###   Statistics
### Aliases: synchrony-package synchrony
### Keywords: synchrony concordance phase locking spatial synchrony
###   correlogram variogram

### ** Examples

# Compute phase synchrony
t1=runif(100)
t2=runif(100)
sync=phase.sync(t1, t2)
# Distribution of phase difference
hist(sync$deltaphase$mod_phase_diff_2pi)

# Compute concordant peaks
p=peaks(t1, t2, nrands=100)
# Find proportion of time steps where both time series peak together
p$peaks
# Plot (null) distribution of proportion of time steps where both time
# series peak together
hist(p$rand)
# p-value of observed value
p$pval

# Compute Kendall's W 
data(bird.traits)
(w=kendall.w(bird.traits))

# Community matrix for 20 species undergoing random fluctuations 
comm.rand=matrix(runif(100), nrow=5, ncol=20)
community.sync(comm.rand, nrands=10)
# Community matrix for 20 species undergoing synchronized fluctuations 
comm.corr=matrix(rep(comm.rand[,1], 20), nrow=5, ncol=20)
community.sync(comm.corr, nrands=10)



