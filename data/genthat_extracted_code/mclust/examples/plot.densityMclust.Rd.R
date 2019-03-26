library(mclust)


### Name: plot.densityMclust
### Title: Plots for Mixture-Based Density Estimate
### Aliases: plot.densityMclust plotDensityMclust1 plotDensityMclust2
###   plotDensityMclustd
### Keywords: cluster dplot

### ** Examples

## Not run: 
##D dens <- densityMclust(faithful$waiting)
##D summary(dens)
##D summary(dens, parameters = TRUE)
##D plot(dens, what = "BIC", legendArgs = list(x = "topright"))
##D plot(dens, what = "density", data = faithful$waiting)
##D 
##D dens <- densityMclust(faithful)
##D summary(dens)
##D summary(dens, parameters = TRUE)
##D plot(dens, what = "density", data = faithful, 
##D      drawlabels = FALSE, points.pch = 20)
##D plot(dens, what = "density", type = "level")
##D plot(dens, what = "density", type = "level", prob = seq(0.1, 0.9, by = 0.1))
##D plot(dens, what = "density", type = "level", data = faithful)
##D plot(dens, what = "density", type = "persp")
##D 
##D dens <- densityMclust(iris[,1:4])
##D summary(dens, parameters = TRUE)
##D plot(dens, what = "density", data = iris[,1:4], 
##D      col = "slategrey", drawlabels = FALSE, nlevels = 7)
##D plot(dens, what = "density", type = "level", data = iris[,1:4])
##D plot(dens, what = "density", type = "persp", col = grey(0.9))
## End(Not run)



