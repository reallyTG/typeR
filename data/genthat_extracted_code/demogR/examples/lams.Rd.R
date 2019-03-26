library(demogR)


### Name: lams
### Title: lams
### Aliases: lams
### Keywords: array algebra

### ** Examples

## simulate two matrices: good year/bad year
## beta distributed survival, gamma fertility

px1 <- rbeta(5,9,1)
px2 <- rbeta(5,7,3)
mx1 <- c(0,rgamma(5,10,10))
mx2 <- c(0,rgamma(5,7,10))
## good year matrix
A1 <- odiag(px1,-1)
A1[1,] <- mx1

## bad year matrix
A2 <- odiag(px2,-1)
A2[1,] <- mx2
aseq <- cbind(matrix(A1,nr=36,nc=1), matrix(A2,nr=36,nc=1))
lams(aseq)



