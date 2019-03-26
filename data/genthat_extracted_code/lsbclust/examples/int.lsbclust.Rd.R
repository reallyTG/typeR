library(lsbclust)


### Name: int.lsbclust
### Title: Interaction Clustering in Least Squares Bilinear Clustering
### Aliases: int.lsbclust

### ** Examples

data("supermarkets")
out <- int.lsbclust(data = supermarkets, margin = 3, delta = c(1,1,0,0), nclust = 4, ndim = 2, 
           fixed = "rows", nstart = 1, alpha = 0)



