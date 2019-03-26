library(orloca)


### Name: distsumgra
### Title: Computes the gradient of distsum function
### Aliases: distsumgra distsumgra,loca.p-method zsumgra
### Keywords: classes optimize

### ** Examples

# A new unweighted loca.p object
loca <- loca.p(x = c(-1, 1, 1, -1), y = c(-1, -1, 1, 1))
# Evaluation of distsum at (0, 0)
distsum(loca)

# Evaluation of distsum at (1, 3)
distsum(loca, 1, 3)
# Compute the objective function at point (3, 4) using lp norm and p = 2.5
distsum(loca, 3, 4, lp=2.5)
# The gradient function at (1,3)
distsumgra(loca, 1, 3)




