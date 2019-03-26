library(rexpokit)


### Name: SparseM_coo_to_REXPOKIT_coo
### Title: Convert a SparseM COO matrix to a plain matrix
### Aliases: SparseM_coo_to_REXPOKIT_coo

### ** Examples

# Example use:
# Make a Q matrix
tmpmat = matrix(c(-1.218, 0.504, 0.336, 0.378, 0.126, -0.882, 0.252, 0.504, 0.168,
0.504, -1.05, 0.378, 0.126, 0.672, 0.252, -1.05), nrow=4, byrow=TRUE)

# Covert to SparseM coo format
tmpmat_in_REXPOKIT_coo_fmt <- mat2coo(tmpmat)



