library(cgraph)


### Name: cg_val
### Title: Evaluate a Node in the Graph
### Aliases: cg_val

### ** Examples

# Initialize a new computational graph.
x <- cgraph$new()

# Add a parameter
a <- x$parm(20, name = "a")

# Evaluate a
x$val(a)




