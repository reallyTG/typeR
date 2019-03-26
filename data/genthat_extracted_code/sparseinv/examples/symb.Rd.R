library(sparseinv)


### Name: symb
### Title: Return the symbolic representation of a Matrix
### Aliases: symb

### ** Examples

require(Matrix)
Q = sparseMatrix(i = c(1, 1, 2, 2),
                 j = c(1, 2, 1, 2),
                 x = c(0.1, 0.2, 0.2, 1))
Qsymb <- symb(Q)
Qsymb



