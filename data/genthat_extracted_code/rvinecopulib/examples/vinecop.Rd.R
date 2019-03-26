library(rvinecopulib)


### Name: vinecop
### Title: Vine copula models
### Aliases: vinecop vinecop_dist vinecop_dist

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

# show model
summary(vc)

# simulate some data
u <- rvinecop(50, vc)

# estimate a vine copula model
fit <- vinecop(u, "par")
fit
summary(fit)
str(fit, 3)




