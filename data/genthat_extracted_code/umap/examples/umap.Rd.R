library(umap)


### Name: umap
### Title: Computes a manifold approximation and projection
### Aliases: umap

### ** Examples

# embedd iris dataset using default settings
iris.umap = umap(iris[,1:4])

# display object summary
iris.umap

# display embedding coordinates
head(iris.umap$layout)




