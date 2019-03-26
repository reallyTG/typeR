library(cgraph)


### Name: cgraph
### Title: Computational Graph
### Aliases: cgraph

### ** Examples

# Initialize a new computational graph.
x <- cgraph$new()

# Add an input with name 'a' to the graph.
a <- input(name = "a")

# Add a parameter with value 4 and name 'b' to the graph.
b <- parm(4, name = "b")

# Perform some operations (i.e. c = exp(a * b)).
c <- cg_exp(a * b, name = "c")

# Evaluate c at a = 2.
values <- run(c, list(a = 2))

# Retrieve the value of c.
values$c

# Differentiate the graph with respect to c.
grads <- gradients(c, values)

# Retrieve the gradient of c with respect to b.
grads$b




