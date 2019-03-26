library(icenReg)


### Name: ir_clustBoot
### Title: Updates the covariance using cluster bootstrap
### Aliases: ir_clustBoot

### ** Examples

# Simulating repeated measures data 
simdata = simIC_cluster(nIDs = 10, nPerID = 4)

# Fitting with basic model
fit = ic_par(cbind(l,u) ~ x1 + x2, data = simdata)
fit

# Updating covariance
ir_clustBoot(fit, ID = simdata$ID, bs_samples = 10)
# (Low number of bootstrap samples used for quick testing by CRAN, 
# never use this few!!)

# Note that the SE's have changed from above
fit



