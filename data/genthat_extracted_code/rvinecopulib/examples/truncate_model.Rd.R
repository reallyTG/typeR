library(rvinecopulib)


### Name: truncate_model
### Title: Truncate a vine copula model
### Aliases: truncate_model truncate_model.rvine_structure
###   truncate_model.rvine_matrix truncate_model.vinecop_dist
###   truncate_model.vine_dist

### ** Examples

# specify pair-copulas
bicop <- bicop_dist("bb1", 90, c(3, 2))
pcs <- list(
    list(bicop, bicop),  # pair-copulas in first tree 
    list(bicop)          # pair-copulas in second tree 
)

# specify R-vine matrix
mat <- matrix(c(1, 2, 3, 1, 2, 0, 1, 0, 0), 3, 3)

# set up vine structure
structure <- as_rvine_structure(mat)

# truncate the model
truncate_model(structure, 1)

# set up vine copula model
vc <- vinecop_dist(pcs, mat)

# truncate the model
truncate_model(vc, 1)



