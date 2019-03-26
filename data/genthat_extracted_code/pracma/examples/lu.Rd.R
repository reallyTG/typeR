library(pracma)


### Name: lu
### Title: LU Matrix Factorization
### Aliases: lu lufact lusys
### Keywords: array

### ** Examples

A <- magic(5)
D <- lu(A, scheme = "ijk")     # Doolittle scheme
D$L %*% D$U
##      [,1] [,2] [,3] [,4] [,5]
## [1,]   17   24    1    8   15
## [2,]   23    5    7   14   16
## [3,]    4    6   13   20   22
## [4,]   10   12   19   21    3
## [5,]   11   18   25    2    9

H4 <- hilb(4)
lufact(H4)$det
## [1] 0.0000001653439

x0 <- c(1.0, 4/3, 5/3, 2.0)
b  <- H4 %*% x0
lusys(H4, b)
##          [,1]
## [1,] 1.000000
## [2,] 1.333333
## [3,] 1.666667
## [4,] 2.000000



