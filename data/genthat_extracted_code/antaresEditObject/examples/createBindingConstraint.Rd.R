library(antaresEditObject)


### Name: createBindingConstraint
### Title: Create a Binding Constraint
### Aliases: createBindingConstraint

### ** Examples

## Not run: 
##D createBindingConstraint(
##D   name = "myconstraint", 
##D   values = matrix(data = rep(0, 8760 * 3), ncol = 3), 
##D   enabled = FALSE, 
##D   timeStep = "hourly",
##D   operator = "both",
##D   coefficients = c("fr%myarea" = 1)
##D )
## End(Not run)



