library(MPkn)


### Name: matrix.powerni
### Title: Matrix Power of Non Integer
### Aliases: matrix.powerni
### Keywords: matrix.powerni

### ** Examples

require(MPkn)
require(matrixcalc)
matmult <- function(A, B){
	C = matrix(numeric(4), 2, 2)
	for (i in 1:2){
		for (j in 1:2){ C[i, j] = sum(A[i, ]*B[, j])}
	}
	return(C)
}
I = diag(1, 2, 2)
P = matrix(c(0.9, 0.3, 0.1, 0.7), 2, 2)
M1 = P
M2 = matmult((I + P), M1)
M4 = matmult((I + t(matrix.power(P, 2))), M2)
M8 = matmult((I + t(matrix.power(P, 4))), M4)
M16 = matmult((I + t(matrix.power(P, 8))), M8)
## =====================
Q = list()
Q[[1]] = M1
Q[[2]] = matmult(M2, matrix.inverse(M1)) - I
Q[[3]] = matrix.powerni(matmult(M4, matrix.inverse(M2)) - I, 1/2)
Q[[4]] = matrix.powerni(matmult(M8, matrix.inverse(M4)) - I, 1/4)
Q[[5]] = matrix.powerni(matmult(M16, matrix.inverse(M8)) - I, 1/8)
print("Q"); print(Q)
S = as.matrix(Q[[1]], 2, 2)
for (i in 2:5){
  S = S + as.matrix(Q[[i]], 2, 2)
}
Qs = S/5
print("Qs"); print(Qs)



