library(trackeR)


### Name: plot.trackeRfpca
### Title: Plot function for functional principal components analysis of
###   distribution and concentration profiles.
### Aliases: plot.trackeRfpca

### ** Examples

## Not run: 
##D data('runs', package = 'trackeR')
##D dp <- distributionProfile(runs, what = 'speed')
##D dp.pca <- funPCA(dp, what = 'speed', nharm = 4)
##D ## 1st harmonic  captures vast majority of the variation
##D plot(dp.pca)
##D plot(dp.pca, harm = 1, pointplot = FALSE)
## End(Not run)



