library(gcKrig)


### Name: profile.mlegc
### Title: Profile Likelihood Based Confidence Interval of Parameters for
###   Gaussian Copula Models in Geostatistical Count Data
### Aliases: profile.mlegc
### Keywords: Estimation

### ** Examples

## Not run: 
##D data(LansingTrees)
##D Treefit4 <- mlegc(y = LansingTrees[,3], x = LansingTrees[,4],
##D                     locs = LansingTrees[,1:2], marginal = zip.gc(link = 'log'),
##D                     corr = matern.gc(kappa = 0.5, nugget = TRUE), method = 'GHK')
##D summary(Treefit4)
##D 
##D profile(Treefit4, 1, 0.05,  method = 'GHK', nrep = 1000, seed = 12345)
##D profile(Treefit4, 2, 0.05,  method = 'GHK', nrep = 1000, seed = 12345)
##D profile(Treefit4, 3, 0.05,  method = 'GHK', nrep = 1000, seed = 12345)
##D profile(Treefit4, 4, 0.05,  method = 'GHK', nrep = 1000, seed = 12345)
##D profile(Treefit4, 5, 0.05, method = 'GHK', nrep = 1000, seed = 12345)
## End(Not run)



