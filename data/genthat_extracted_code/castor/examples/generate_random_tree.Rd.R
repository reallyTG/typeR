library(castor)


### Name: generate_random_tree
### Title: Generate a tree using a Poissonian speciation/extinction model.
### Aliases: generate_random_tree
### Keywords: random speciation tree model

### ** Examples

# Simple speciation model
parameters = list(birth_rate_intercept=1)
tree = generate_random_tree(parameters,max_tips=100)$tree

# Exponential growth rate model
parameters = list(birth_rate_factor=1)
tree = generate_random_tree(parameters,max_tips=100)$tree



