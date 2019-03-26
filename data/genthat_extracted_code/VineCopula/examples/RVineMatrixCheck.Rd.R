library(VineCopula)


### Name: RVineMatrixCheck
### Title: R-Vine Matrix Check
### Aliases: RVineMatrixCheck

### ** Examples


A1 <- matrix(c(6, 0, 0, 0, 0, 0,
               5, 5, 0, 0, 0, 0,
               3, 4, 4, 0, 0, 0,
               4, 3, 3, 3, 0, 0,
               1, 1, 2, 2, 2, 0,
               2, 2, 1, 1, 1, 1), 6, 6, byrow = TRUE)
b1 <- RVineMatrixCheck(A1)
print(b1)
# improper vine matrix, code=-1
A2 <- matrix(c(6, 0, 0, 0, 0, 0,
               5, 5, 0, 0, 0, 0,
               4, 4, 4, 0, 0, 0,
               1, 3, 3, 3, 0, 0,
               3, 1, 2, 2, 2, 0,
               2, 2, 1, 1, 1,1 ), 6, 6, byrow = TRUE)
b2 <- RVineMatrixCheck(A2)
print(b2)
# improper vine matrix, code=-2
A3 <- matrix(c(6, 0, 0, 0, 0, 0,
               3, 5, 0, 0, 0, 0,
               3, 4, 4, 0, 0, 0,
               4, 3, 3, 3, 0, 0,
               1, 1, 2, 2, 2, 0,
               2, 2, 1, 1, 1, 1), 6, 6, byrow = TRUE)
b3 <- RVineMatrixCheck(A3)
print(b3)




