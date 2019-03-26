library(rvinecopulib)


### Name: vinecop_distributions
### Title: Vine copula distributions
### Aliases: vinecop_distributions dvinecop pvinecop rvinecop dvinecop_dist
###   pvinecop_dist rvinecop_dist pvinecop rvinecop

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

# simulate from the model
u <- rvinecop(200, vc)
pairs(u)

# evaluate the density and cdf
dvinecop(u[1, ], vc)
pvinecop(u[1, ], vc)




