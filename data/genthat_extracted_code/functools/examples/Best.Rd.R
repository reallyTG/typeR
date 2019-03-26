library(functools)


### Name: Best
### Title: Find the best value in a vector.
### Aliases: Best

### ** Examples

# Simulate the behavior of max with numerics
Best(1:10, function(x, y) return(x > y))
# Simulate the behavior of min with numerics
Best(1:10, function(x, y) return(x < y))
# This comparison function prefers values that begin with l
Best(letters, function(x, y) return(x[1] == "l"))



