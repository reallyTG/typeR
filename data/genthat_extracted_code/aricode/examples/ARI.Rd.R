library(aricode)


### Name: ARI
### Title: Adjusted Rand Index
### Aliases: ARI

### ** Examples

data(iris)
cl <- cutree(hclust(dist(iris[,-5])), 4)
ARI(cl,iris$Species)



