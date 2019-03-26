library(trackeR)


### Name: funPCA
### Title: Functional principal components analysis of distribution or
###   concentration profiles.
### Aliases: funPCA funPCA.distrProfile funPCA.conProfile funPCA

### ** Examples

## Not run: 
##D data('runs', package = 'trackeR')
##D dp <- distributionProfile(runs, what = 'speed')
##D dp.pca <- funPCA(dp, what = 'speed', nharm = 4)
##D ## 1st harmonic  captures vast majority of the variation
##D plot(dp.pca, harm = 1)
##D ## time spent above speed = 0 is the characteristic distinguishing the profiles
##D sumRuns <- summary(runs)
##D plot(sumRuns$durationMoving, dp.pca$scores[,1])
## End(Not run)



