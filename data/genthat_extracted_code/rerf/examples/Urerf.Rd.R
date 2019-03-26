library(rerf)


### Name: Urerf
### Title: Unsupervised RerF forest Generator
### Aliases: Urerf

### ** Examples

### Train RerF on numeric data ###
library(rerf)
urerfStructure <- Urerf(as.matrix(iris[, 1:4]))
urerfStructure.bic <- Urerf(as.matrix(iris[, 1:4]), splitCrit = 'bicfast')

dissimilarityMatrix <- hclust(as.dist(1 - urerfStructure$similarityMatrix), method = "mcquitty")
clusters <- cutree(dissimilarityMatrix, k = 3)





