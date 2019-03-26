library(cgraph)


### Name: set
### Title: Change the Value of a Node in the Graph
### Aliases: set

### ** Examples

# Initialize a new computational graph.
x <- cgraph$new()

# Add a parameter
a <- parm(20, name = "a")

# Change value of a
set(a, 40)

# Evaluate a
val(a)




