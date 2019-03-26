library(archdata)


### Name: RBGlass1
### Title: Romano-British Glass, Major and Minor Elements
### Aliases: RBGlass1
### Keywords: datasets

### ** Examples

data(RBGlass1)
RBGlass1.pca <- prcomp(RBGlass1[, -1], scale.=TRUE)
biplot(RBGlass1.pca, xlabs=abbreviate(RBGlass1$Site, 1), cex=.75)



