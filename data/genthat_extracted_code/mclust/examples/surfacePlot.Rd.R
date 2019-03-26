library(mclust)


### Name: surfacePlot
### Title: Density or uncertainty surface for bivariate mixtures
### Aliases: surfacePlot
### Keywords: cluster

### ** Examples

## Not run: 
##D faithfulModel <- Mclust(faithful)
##D surfacePlot(faithful, parameters = faithfulModel$parameters,
##D             type = "contour", what = "density", transformation = "none",
##D             drawlabels = FALSE)
##D surfacePlot(faithful, parameters = faithfulModel$parameters,
##D             type = "persp", what = "density", transformation = "log")
##D surfacePlot(faithful, parameters = faithfulModel$parameters,
##D             type = "contour", what = "uncertainty", transformation = "log")
## End(Not run)



