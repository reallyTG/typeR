library(excursions)


### Name: contourmap.colors
### Title: Define a color map for displaying contour maps.
### Aliases: contourmap.colors

### ** Examples

n = 10
Q = Matrix(toeplitz(c(1, -0.5, rep(0, n-2))))
map <- contourmap(mu = seq(-5, 5, length=n),Q,n.levels = 2,
                  compute=list(F=FALSE),max.threads=1)
cols = contourmap.colors(map, col=heat.colors(100, 1),
                         credible.col = grey(0.5, 1))



