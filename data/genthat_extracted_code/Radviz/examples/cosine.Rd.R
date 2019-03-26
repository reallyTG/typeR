library(Radviz)


### Name: cosine
### Title: Compute the Cosine Similarity between the Columns of a Data Set
### Aliases: cosine

### ** Examples

data(iris)
das <- c('Sepal.Length','Sepal.Width','Petal.Length','Petal.Width')
mat <- iris[,das]
scaled <- apply(mat,2,do.L)
sim.mat <- cosine(scaled)
ncol(mat)
dim(sim.mat)




