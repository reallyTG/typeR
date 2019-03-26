library(vegan)


### Name: screeplot.cca
### Title: Screeplots for Ordination Results and Broken Stick Distributions
### Aliases: screeplot.cca screeplot.princomp screeplot.prcomp
###   screeplot.decorana bstick bstick.default bstick.cca bstick.prcomp
###   bstick.princomp bstick.decorana
### Keywords: multivariate

### ** Examples

data(varespec)
vare.pca <- rda(varespec, scale = TRUE)
bstick(vare.pca)
screeplot(vare.pca, bstick = TRUE, type = "lines")



