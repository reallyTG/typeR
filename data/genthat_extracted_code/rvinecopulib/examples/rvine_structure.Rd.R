library(rvinecopulib)


### Name: rvine_structure
### Title: R-vine structure
### Aliases: rvine_structure rvine_matrix is.rvine_structure
###   is.rvine_matrix rvine_matrix

### ** Examples


# R-vine structures can be constructed from the order vector and struct_array
rvine_structure(order = 1:4, struct_array = list(c(1, 1, 1), 
                                                 c(2, 2), 
                                                 3))

# R-vine matrices can be constructed from standard matrices
mat <- matrix(c(1, 2, 3, 4, 1, 2, 3, 0, 1, 2, 0, 0, 1, 0, 0, 0), 4, 4)
rvine_matrix(mat)

# coerce to R-vine structure
str(as_rvine_structure(mat))

# truncate and construct the R-vine matrix
mat[3, 1] <- 0
rvine_matrix(mat)

# or use directly the R-vine structure constructor
rvine_structure(order = 1:4, struct_array = list(c(1, 1, 1), 
                                                 c(2, 2)))

# throws an error
mat[3, 1] <- 5
try(rvine_matrix(mat))




