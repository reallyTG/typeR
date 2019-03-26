library(cgraph)


### Name: cg_run
### Title: Evaluate the Graph
### Aliases: cg_run

### ** Examples

# Initialize a new computational graph.
x <- cgraph$new()

# Add an input.
a <- x$input(name = "a")

# Square the input (i.e. b = a^2).
b <- cg_pow(a, x$const(2), name = "b")

# Evaluate b at a = 2.
values <- x$run(b, list(a = 2))

# Retrieve the value of b.
values$b




