library(cgraph)


### Name: cg_gradients
### Title: Calculate Gradients
### Aliases: cg_gradients

### ** Examples

# Initialize a new computational graph.
x <- cgraph$new()

# Add some parameters.
a <- x$parm(2, name = "a")
b <- x$parm(4, name = "b")

# Perform some operations on the parameters.
c <- cg_sin(a) + cg_cos(b) - cg_tan(a)

# Differentiate the graph with respect to c.
grads <- x$gradients(c, x$run(c))

# Retrieve the gradient of c with respect to a.
grads$a




