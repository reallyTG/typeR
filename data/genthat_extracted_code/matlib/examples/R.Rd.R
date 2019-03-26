library(matlib)


### Name: R
### Title: Rank of a Matrix
### Aliases: R

### ** Examples

M <- outer(1:3, 3:1)
M
R(M)

M <- matrix(1:9, 3, 3)
M
R(M)
# why rank=2?
echelon(M)

set.seed(1234)
M <- matrix(sample(1:9), 3, 3)
M
R(M)



