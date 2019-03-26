library(mclust)


### Name: densityMclust
### Title: Density Estimation via Model-Based Clustering
### Aliases: densityMclust
### Keywords: cluster

### ** Examples

dens <- densityMclust(faithful$waiting)
summary(dens)
summary(dens, parameters = TRUE)
plot(dens, what = "BIC", legendArgs = list(x = "topright"))
plot(dens, what = "density", data = faithful$waiting)

dens <- densityMclust(faithful)
summary(dens)
summary(dens, parameters = TRUE)
plot(dens, what = "density", data = faithful, 
     drawlabels = FALSE, points.pch = 20)
plot(dens, what = "density", type = "level")
plot(dens, what = "density", type = "level", prob = seq(0.1, 0.9, by = 0.1))
plot(dens, what = "density", type = "level", data = faithful)
plot(dens, what = "density", type = "persp")

dens <- densityMclust(iris[,1:4])
summary(dens, parameters = TRUE)
plot(dens, what = "density", data = iris[,1:4], 
     col = "slategrey", drawlabels = FALSE, nlevels = 7)
plot(dens, what = "density", type = "level", data = iris[,1:4])
## Not run: 
##D plot(dens, what = "density", type = "persp", col = grey(0.9))
## End(Not run)



