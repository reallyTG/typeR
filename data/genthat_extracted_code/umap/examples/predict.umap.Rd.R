library(umap)


### Name: predict.umap
### Title: project data points onto an existing umap embedding
### Aliases: predict.umap

### ** Examples

# embedd iris dataset using default settings
iris.umap = umap(iris[,1:4])

# create a dataset with structure like iris, but with perturbation
iris.perturbed = iris[,1:4] + matrix(rnorm(nrow(iris)*4, 0, 0.1), ncol=4)

# project perturbed dataset
perturbed.embedding = predict(iris.umap, iris.perturbed)

# output is a matrix with embedding coordinates
head(perturbed.embedding)




