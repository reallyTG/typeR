## ----message=FALSE-------------------------------------------------------
require(matrixcalc)
An = 2
matmult <- function(A, B){
	C = matrix(numeric(4), 2, 2)
	for (i in 1:2){
		for (j in 1:2){ C[i, j] = sum(A[i, ]*B[, j])}
	}
	return(C)
}
Q = array(c(0.58, 0.53, 0.42, 0.47), c(2, 2))
q = 0
for (i in 1:8){
  q = q + matrix.power(Q, i)
}
print(paste("i =", i))
print(q)
M = Q
I = diag(1, 2, 2)
n = c(1, 2, 4, 8)
for (i in 2:length(n)){
  M = matmult((I + matrix.power(Q, n[i-1])), M)
}
print(paste("n[i] =", n[i]))
print(M)

## ------------------------------------------------------------------------
Q = array(c(0.58, 0.53, 0.42, 0.47), c(2, 2))
k = 3
q = 0
for (i in 1:48){
  q = q + matrix.power(Q, i)
  if (i == k) Qk = q
}
print(paste("i =", i))
print(q)
  
M = Qk
I = diag(1, 2, 2)
n = integer(5)
for (i in 1:5){
  n[i] = k*2^(i-1)
}
print(n)
for (i in 2:length(n)){
  M = matmult((I + matrix.power(Q, n[i-1])), M)
}
print(paste("n[i] =", n[i]))
print(M)
  

