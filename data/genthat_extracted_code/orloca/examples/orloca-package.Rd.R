library(orloca)


### Name: orloca-package
### Title: Operations Research LOCational Analysis Models
### Aliases: orloca-package
### Keywords: optimize package

### ** Examples

# A new unweighted loca.p object
o <- loca.p(x = c(-1, 1, 1, -1), y = c(-1, -1, 1, 1))

# Compute the sum of distances to point (3, 4)
distsum(o, 3, 4)

# Compute the sum of distances to point (3, 4) using lp norm
distsum(o, 3, 4, lp=2.5)

# Solve the optimization problem
distsummin(o)
# Contour plot
contour(o)

# Make a demo of the package
demo(orloca)




