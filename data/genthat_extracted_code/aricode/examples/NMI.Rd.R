library(aricode)


### Name: NMI
### Title: Normalized mutual information (NMI)
### Aliases: NMI

### ** Examples

data(iris)
cl <- cutree(hclust(dist(iris[,-5])), 4)
NMI(cl,iris$Species)



