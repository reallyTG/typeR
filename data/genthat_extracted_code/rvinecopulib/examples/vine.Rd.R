library(rvinecopulib)


### Name: vine
### Title: Vine copula models
### Aliases: vine vine_dist vine_dist

### ** Examples

# specify pair-copulas
bicop <- bicop_dist("bb1", 90, c(3, 2))
pcs <- list(
    list(bicop, bicop),  # pair-copulas in first tree 
    list(bicop)          # pair-copulas in second tree 
 )
 
# specify R-vine matrix
mat <- matrix(c(1, 2, 3, 1, 2, 0, 1, 0, 0), 3, 3) 

# set up vine copula model with Gaussian margins
vc <- vine_dist(list(distr = "norm"), pcs, mat)

# show model
summary(vc)

# simulate some data
x <- rvine(50, vc)

# estimate a vine copula model
fit <- vine(x, copula_controls = list(family_set = "par"))
summary(fit)




