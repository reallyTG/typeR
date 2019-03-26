library(hyperSpec)


### Name: decomposition
### Title: Convert Principal Component Decomposition or the like into a
###   hyperSpec Object
### Aliases: decomposition
### Keywords: manip methods

### ** Examples

pca <- prcomp (flu)

pca.loadings <- decomposition (flu, t (pca$rotation), scores = FALSE)
pca.center <- decomposition (flu, pca$center, scores = FALSE)
pca.scores <- decomposition (flu, pca$x)

plot (pca.center)
plot (pca.loadings, col = c ("red", "gray50"))
plotc (pca.scores, groups = .wavelength)



