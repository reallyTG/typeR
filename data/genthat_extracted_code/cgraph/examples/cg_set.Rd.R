library(cgraph)


### Name: cg_set
### Title: Change the Value of a Node in the Graph
### Aliases: cg_set

### ** Examples

# Initialize a new computational graph.
x <- cgraph$new()

# Add a parameter
a <- x$parm(20, name = "a")

# Change value of a
x$set(a, 40)

# Evaluate a
x$val(a)




