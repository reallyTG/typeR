library(kexpmv)


### Name: kexpmv-package
### Title: Matrix exponentiation using Krylov subspace routines

### ** Examples

library(kexpmv)

# Construct a square (nxn) matrix
mat=matrix(c(-0.071207, 0.065573, 0.005634, 0, -0.041206, 0.041206, 0, 0, 0), 
nrow=3, byrow=TRUE) 
 
# Define value for t 
t = 15
 
# Exponentiate this matrix using DGPADM for t = 15 
OutputMat = expokit_dgpadm( mat = mat, t = t, transpose_needed = TRUE)
print(OutputMat)

# Construct column (nx1) vector
v = matrix(0,3,1)
v[1] = 1
 	
# Exponentiate the matrix using DMEXPV for t = 15 with the product of vector v.
OutputMat = expokit_dmexpv( mat = mat, t = t, vector = v, transpose_needed = TRUE,
transform_to_crs = TRUE)

# Print corresponding (nx1) results vector
print(OutputMat$output_probs)

# Print message to determine whether the mxstep value needs increased. If NULL
# then mxstep value is valid.
print(OutputMat$message)

# Exponentiate the matrix using DGEXPV for t = 15.
OutputMat = expokit_dgexpv( mat = mat, t = t, vector = NULL, transpose_needed = TRUE,
transform_to_crs = TRUE)
print(OutputMat$output_mat)
print(OutputMat$message)

# Functions DMEXPV and DGEXPV are very similiar, with the only difference being DMEXPV
# carries out an additional check for Markov chains.


