library(rvinecopulib)


### Name: as_rvine_structure
### Title: Coerce various kind of objects to R-vine structures and matrices
### Aliases: as_rvine_structure as_rvine_matrix as_rvine_matrix
###   as_rvine_structure.rvine_structure as_rvine_matrix.rvine_structure
###   as_rvine_structure.list as_rvine_matrix.list
###   as_rvine_structure.rvine_matrix as_rvine_matrix.rvine_matrix
###   as_rvine_structure.matrix as_rvine_matrix.matrix

### ** Examples

# R-vine structures can be constructed from the order vector and struct_array
rvine_structure(order = 1:4, struct_array = list(c(1, 1, 1), 
                                                 c(2, 2), 
                                                 3))

# ... or a similar list can be coerced into an R-vine structure
as_rvine_structure(list(order = 1:4, struct_array = list(c(1, 1, 1), 
                                                         c(2, 2), 
                                                         3)))

# similarly, standard matrices can be coerced into R-vine structures
mat <- matrix(c(1, 2, 3, 4, 1, 2, 3, 0, 1, 2, 0, 0, 1, 0, 0, 0), 4, 4)
as_rvine_structure(mat)

# or truncate and construct the structure
mat[3, 1] <- 0
as_rvine_structure(mat)

# throws an error
mat[3, 1] <- 5
try(as_rvine_structure(mat))



