library(wevid)


### Name: plotroc
### Title: Plot crude and model-based ROC curves
### Aliases: plotroc

### ** Examples

data(cleveland)
densities <- with(cleveland, Wdensities(y, posterior.p, prior.p))
plotroc(densities)




