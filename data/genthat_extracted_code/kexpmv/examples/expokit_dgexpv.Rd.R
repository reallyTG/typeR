library(kexpmv)


### Name: expokit_dgexpv
### Title: EXPOKIT DGEXPV matrix exponentiation on a square matrix
### Aliases: expokit_dgexpv

### ** Examples

# Make a square (n x n) matrix A
# Use expokit_dgexpv to calculate both exp(At) and exp(At)v, where t is a 
# time value and v is an n dimensional column vector.
mat=matrix(c(-0.071207, 0.065573, 0.005634, 0, -0.041206, 0.041206, 0, 0, 0), 
nrow=3, byrow=TRUE)

# Set the time variable t
 t=15

# Exponentiate with EXPOKIT's dgexpv to obtain the full matrix exponential
OutputMat = expokit_dgexpv(mat=mat, t=t, transpose_needed=TRUE, vector=NULL)

print(OutputMat$output_mat)
print(OutputMat$message)

# Can also calculate the matrix exponential with the product of a vector.
# Create the n dimensional vector
v = matrix(0,3,1)
v[1] = 1

# Exponentiate with EXPOKIT's dgexpv
OutputMat = expokit_dgexpv(mat=mat, t=t, transpose_needed=TRUE, vector=v)

print(OutputMat$output_probs)
print(OutputMat$message)

# If message is 'NULL' then no error has occured and the number of 
# mxsteps defined in the function is acceptable.




