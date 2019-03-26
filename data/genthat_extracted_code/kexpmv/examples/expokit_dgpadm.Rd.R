library(kexpmv)


### Name: expokit_dgpadm
### Title: EXPOKIT dgpadm matrix exponentiation on a square matrix
### Aliases: expokit_dgpadm

### ** Examples

# Define input matrix to be exponentiated
mat=matrix(c(-0.071207, 0.065573, 0.005634, 0, -0.041206, 0.041206, 0, 0, 0), 
nrow=3, byrow=TRUE) 

# Define value of t 
t=15

# Exponentiate with EXPOKIT's dgpadm
	Pmat = expokit_dgpadm(mat=mat, t=t, transpose_needed=TRUE)
	print(Pmat)





