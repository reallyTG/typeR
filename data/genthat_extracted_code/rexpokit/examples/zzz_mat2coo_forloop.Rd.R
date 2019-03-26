library(rexpokit)


### Name: mat2coo_forloop
### Title: Convert matrix to COO format using nested for-loops
### Aliases: mat2coo_forloop

### ** Examples

# Example use:
# Make a Q matrix
tmpmat = matrix(c(-1.218, 0.504, 0.336, 0.378, 0.126, -0.882, 0.252, 0.504, 0.168,
0.504, -1.05, 0.378, 0.126, 0.672, 0.252, -1.05), nrow=4, byrow=TRUE)

# Convert to REXPOKIT coo format
tmpmat_in_REXPOKIT_coo_fmt = mat2coo_forloop(tmpmat)
tmpmat_in_REXPOKIT_coo_fmt



