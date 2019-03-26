library(wordspace)


### Name: DSM_HieroglyphsMatrix
### Title: A Small Co-occurrence Matrix (wordspace)
### Aliases: DSM_HieroglyphsMatrix
### Keywords: datasets

### ** Examples


print(DSM_HieroglyphsMatrix)

## cosine similarities between rows of the matrix
round(dist.matrix(DSM_HieroglyphsMatrix, convert=FALSE), 3)




