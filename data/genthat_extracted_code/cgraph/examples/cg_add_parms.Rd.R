library(cgraph)


### Name: cg_add_parms
### Title: Add Parameters
### Aliases: cg_add_parms

### ** Examples

# Initialize a new computational graph.
x <- cgraph$new()

# Add some parameters.
x$add_parms(prm1 = 1, prm2 = 2, prm3 = 3)

# List the parameters.
x$get_parms()




