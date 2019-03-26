library(aricode)


### Name: entropy
### Title: Entropy
### Aliases: entropy

### ** Examples

data(iris)
cl <- cutree(hclust(dist(iris[,-5])), 4)
entropy(cl,iris$Species)



