library(mvc)


### Name: conceptIndicesSkm
### Title: Calculate partitions (concept indices) by assigning each vector
###   to the closest concept vector.
### Aliases: conceptIndicesSkm

### ** Examples
{ 
X=structure(c(1, 1, -1, 0, 1, 0, -1, -1), .Dim = c(4L, 2L))
C=structure(c(0.894427190999916, -0.447213595499958, 
0.447213595499958, -0.894427190999916), .Dim = c(2L, 2L))
CIdx=conceptIndicesSkm(X,C)
dput(CIdx) 
# c(1, 1, 2, 2)
}


