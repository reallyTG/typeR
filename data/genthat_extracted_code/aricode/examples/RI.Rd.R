library(aricode)


### Name: RI
### Title: Rand Index
### Aliases: RI

### ** Examples

data(iris)
cl <- cutree(hclust(dist(iris[,-5])), 4)
RI(cl,iris$Species)



