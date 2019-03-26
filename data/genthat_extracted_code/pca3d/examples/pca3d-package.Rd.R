library(pca3d)


### Name: pca2d
### Title: Show a three- or two-dimensional plot of a prcomp object
### Aliases: pca2d pca3d pca3d-package
### Keywords: PCA biplot prcomp princomp

### ** Examples

data( metabo )
  pca <- prcomp( metabo[,-1], scale.= TRUE )

  pca3d( pca, group= metabo[,1] )
  pca2d( pca, group= metabo[,1] )

  ## a bit more fancy:
  ## black background, white axes,
  ## centroids
  pca3d( pca, group= metabo[,1],
    fancy= TRUE, bg= "black",
    axes.color= "white", new= TRUE )



