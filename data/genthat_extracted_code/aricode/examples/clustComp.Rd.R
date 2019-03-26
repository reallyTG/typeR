library(aricode)


### Name: clustComp
### Title: measures of similarity between two classification
### Aliases: clustComp

### ** Examples

data(iris)
cl <- cutree(hclust(dist(iris[,-5])), 4)
clustComp(cl,iris$Species)



