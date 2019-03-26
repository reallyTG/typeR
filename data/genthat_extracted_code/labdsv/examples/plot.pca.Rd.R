library(labdsv)


### Name: plot.pca
### Title: Plotting Routines For Principal Components Ordinations
### Aliases: plot.pca points.pca plotid.pca hilight.pca chullord.pca
###   surf.pca varplot.pca
### Keywords: hplot aplot iplot

### ** Examples

data(bryceveg)
data(brycesite)
pca.1 <- pca(bryceveg)
plot(pca.1)
points(pca.1,brycesite$elev>8000)
surf(pca.1,brycesite$elev)
## Not run: plotid(pca.1,ids=row.names(bryceveg))



