library(archdata)


### Name: RBGlass2
### Title: Romano-British Glass, Trace Elements
### Aliases: RBGlass2
### Keywords: datasets

### ** Examples

data(RBGlass2)
RBGlass2.pca <- prcomp(RBGlass2[, -1], scale.=TRUE)
biplot(RBGlass2.pca, xlabs=abbreviate(RBGlass2$Site, 1), cex=.75)



