library(OptimalDesign)


### Name: od.infmat
### Title: Information matrix
### Aliases: od.infmat

### ** Examples

# The information matrix of an approximate design with weights 1/4 
# in -1, -0.4, 0.4, 1 for the cubic model on a discretization of 
# the interval [-1,1]
F.1D <- F.cube(~x1 + I(x1 ^ 2) + I(x1 ^ 3), -1, 1, 11)
round(od.infmat(F.1D, c(0.25,0,0,0.25,0,0,0,0.25,0,0,0.25)), 6)

# The information matrix of a random exact design for the full quadratic 
# model with 2 factors; the first with levels -1,0,1, and the second with 
# levels -1,0.5,0,0.5,1.
F.2D <- F.cube(~x1*x2 + I(x1^2) + I(x2^2), c(-1, -1), c(1, 1), c(3, 5))
od.infmat(F.2D, sample(0:1, dim(F.2D)[1], replace=TRUE))

# The matrix of the lattice design at levels 0, 0.5, 1 for the Scheffe 
# quadratic mixture model with 3 mixture components, each with levels 
# {0, 0.25, 0.5, 0.75, 1}.
F.scheffe <- F.simplex(~x1 + x2 + x3 + I(x1*x2) + I(x1*x3) + 
                       I(x2*x3) - 1, 3, 5)
w.lattice <- rep(0, 15); w.lattice[c(1,3,5,10,12,15)] <- 1
od.infmat(F.scheffe, w.lattice)



