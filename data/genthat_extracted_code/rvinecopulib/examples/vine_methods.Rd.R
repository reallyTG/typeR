library(rvinecopulib)


### Name: vine_distributions
### Title: Vine based distributions
### Aliases: vine_distributions dvine pvine rvine dvine_dist pvine_dist
###   rvine_dist pvine rvine

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
vc <- vine_dist(list(distr = "norm"), pcs, mat)

# simulate from the model
x <- rvine(200, vc)
pairs(x)

# evaluate the density and cdf
dvine(x[1, ], vc)
pvine(x[1, ], vc)



