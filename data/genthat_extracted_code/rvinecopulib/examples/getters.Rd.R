library(rvinecopulib)


### Name: getters
### Title: Extracts components of 'bicop_dist' and 'vinecop_dist' objects
### Aliases: getters get_structure get_pair_copula get_all_pair_copulas
###   get_parameters get_all_parameters get_ktau get_all_ktaus get_matrix
###   get_pair_copula get_parameters get_ktau get_family
###   get_all_pair_copulas get_all_parameters get_all_ktaus
###   get_all_families

### ** Examples

# specify pair-copulas
bicop <- bicop_dist("bb1", 90, c(3, 2))
pcs <- list(
    list(bicop, bicop),  # pair-copulas in first tree 
    list(bicop)          # pair-copulas in second tree 
)

# specify R-vine matrix
mat <- matrix(c(1, 2, 3, 1, 2, 0, 1, 0, 0), 3, 3) 

# set up vine copula model
vc <- vinecop_dist(pcs, mat)

# get the structure
get_structure(vc)
all.equal(get_matrix(vc), mat, check.attributes = FALSE)

# get pair-copulas
get_pair_copula(vc, 1, 1)
get_all_pair_copulas(vc)
all.equal(get_all_pair_copulas(vc), pcs, check.attributes = FALSE)




