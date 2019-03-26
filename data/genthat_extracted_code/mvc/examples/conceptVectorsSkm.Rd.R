library(mvc)


### Name: conceptVectorsSkm
### Title: Calculate concept vectors for Spherical k-Means as unit length
###   sum of vectors of the k clusters.
### Aliases: conceptVectorsSkm

### ** Examples
{
X=structure(c(1, 1, -1, 0, 1, 0, -1, -1), .Dim = c(4L, 2L))
CIdx=c(1, 1, 2, 2)
C=conceptVectorsSkm(X,CIdx)
dput(C) 
# structure(c(0.894427190999916, -0.447213595499958, 
# 0.447213595499958, -0.894427190999916), .Dim = c(2L, 2L))
}


