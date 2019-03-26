library(trackeR)


### Name: profile2fd
### Title: Transform distribution and concentration profiles to functional
###   data objects of class fd.
### Aliases: profile2fd

### ** Examples

## Not run: 
##D library('fda')
##D data('runs', package = 'trackeR')
##D dp <- distributionProfile(runs, what = 'speed')
##D dpFun <- profile2fd(dp, what = 'speed',
##D     fdnames = list('speed', 'sessions', 'time above threshold'))
##D dp.pca <- pca.fd(dpFun, nharm = 4)
##D ## 1st harmonic  captures vast majority of the variation
##D dp.pca$varprop
##D ## time spent above speed = 0 is the characteristic distinguishing the profiles
##D plot(dp.pca, harm = 1)
##D sumRuns <- summary(runs)
##D plot(sumRuns$durationMoving, dp.pca$scores[,1])
## End(Not run)



