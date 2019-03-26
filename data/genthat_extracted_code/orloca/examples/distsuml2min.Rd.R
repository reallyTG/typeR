library(orloca)


### Name: distsuml2min
### Title: distsuml2min at orloca package
### Aliases: distsuml2min distsuml2min,loca.p-method
### Keywords: classes internal optimize

### ** Examples

# A new unweighted loca.p object
loca <- loca.p(x = c(-1, 1, 1, -1), y = c(-1, -1, 1, 1))
# Compute the minimum
sol<-distsummin(loca)

# Show the result
sol

# Evaluation of the objective function at solution point
distsum(loca, sol[1], sol[2])




