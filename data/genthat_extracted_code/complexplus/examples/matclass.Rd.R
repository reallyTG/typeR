library(complexplus)


### Name: matclass
### Title: Matrix Class
### Aliases: matclass

### ** Examples

A <- matrix(c(1, 2, 2+3i, 5), ncol = 2)  # complex matrix
B <- matrix(1:4, ncol = 2)  # real matrix
C <- matrix(c(TRUE, TRUE, FALSE, FALSE), ncol = 2)  # boolean matrix
D <- matrix(c('a', 'b', 'c', 'd'), ncol = 2)  # character matrix
E <- matrix(c(1,2+3i,'a',TRUE),ncol=2)  # 1 single character makes it a character matrix

matclass(A)
matclass(B)
matclass(B,FALSE)
matclass(C)
matclass(D)
matclass(E)




