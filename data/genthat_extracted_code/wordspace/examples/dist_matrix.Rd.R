library(wordspace)


### Name: dist.matrix
### Title: Distances/Similarities between Row or Column Vectors (wordspace)
### Aliases: dist.matrix

### ** Examples


M <- DSM_TermTermMatrix
dist.matrix(M, as.dist=TRUE)                     # angular distance
dist.matrix(M, method="euclidean", as.dist=TRUE) # Euclidean distance
dist.matrix(M, method="manhattan", as.dist=TRUE) # Manhattan distance
dist.matrix(M, method="minkowski", p=1, as.dist=TRUE)  # L_1 distance
dist.matrix(M, method="minkowski", p=99, as.dist=TRUE) # almost L_Inf
dist.matrix(M, method="maximum", as.dist=TRUE)         # L_Inf (maximum)
dist.matrix(M, method="minkowski", p=.5, as.dist=TRUE) # L_0.5 distance
dist.matrix(M, method="minkowski", p=0, as.dist=TRUE)  # Hamming distance

round(dist.matrix(M, method="cosine", convert=FALSE), 3) # cosine similarity




