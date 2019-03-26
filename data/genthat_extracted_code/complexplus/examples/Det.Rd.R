library(complexplus)


### Name: Det
### Title: Compute the Determinant of a Matrix
### Aliases: Det

### ** Examples

A <- matrix(c(1, 2, 2+3i, 5), ncol = 2) #complex matrix
B <- matrix(1:4, ncol = 2) #real matrix
S <- matrix(c(3, 4+3i, 0, 0), ncol = 2) #Singular matrix

Det(A)
Det(B)
Det(S)




