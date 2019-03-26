library(aricode)


### Name: NID
### Title: Normalized information distance (NID)
### Aliases: NID

### ** Examples

data(iris)
cl <- cutree(hclust(dist(iris[,-5])), 4)
NID(cl,iris$Species)



