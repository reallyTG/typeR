library(orloca)


### Name: distsummin
### Title: Returns the solution of the minimization problem
### Aliases: distsummin distsummin,loca.p-method zsummin
### Keywords: classes optimize

### ** Examples

# A new unweighted loca.p object
loca <- loca.p(x = c(-1, 1, 1, -1), y = c(-1, -1, 1, 1))
# Compute the minimum
sol<-distsummin(loca)

# Show the result
sol

# Evaluation of the objective function at solution point
distsum(loca, sol[1], sol[2])




