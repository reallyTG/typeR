library(mclust)


### Name: clPairs
### Title: Pairwise Scatter Plots showing Classification
### Aliases: clPairs clPairsLegend
### Keywords: cluster

### ** Examples

clPairs(iris[,1:4], cl = iris$Species)

clp <- clPairs(iris[,1:4], cl = iris$Species, lower.panel = NULL)
clPairsLegend(0.1, 0.4, class = clp$class, 
              col = clp$col, pch = clp$pch, 
              title = "Iris data")




