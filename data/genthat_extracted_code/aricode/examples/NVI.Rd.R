library(aricode)


### Name: NVI
### Title: Normalized variation of information (NVI)
### Aliases: NVI

### ** Examples

data(iris)
cl <- cutree(hclust(dist(iris[,-5])), 4)
NVI(cl,iris$Species)



