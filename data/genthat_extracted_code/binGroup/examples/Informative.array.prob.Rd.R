library(binGroup)


### Name: Informative.array.prob
### Title: Arrange a matrix of probabilities for informative array testing
### Aliases: Informative.array.prob

### ** Examples

# Use the gradient arrangement method to create a matrix
#   of individual risk probabilities for a 10x10 array.
# Depending on the specified probability, alpha level, 
#   and overall group size, simulation may be necessary in 
#   order to generate the vector of individual probabilities. 
#   This is done using the p.vec.func() function and requires 
#   the user to set a seed in order to reproduce results.
# This example takes less than 1 second to run.
# Estimated running time was calculated using a 
#   computer with 16 GB of RAM and one core of an 
#   Intel i7-6500U processor.
set.seed(1107)
p.vec1 <- p.vec.func(p=0.05, alpha=2, grp.sz=100)
Informative.array.prob(prob.vec=p.vec1, nr=10, nc=10, method="gd")

# Use the spiral arrangement method to create a matrix
#   of individual risk probabilities for a 5x5 array.
# Depending on the specified probability, alpha level, 
#   and overall group size, simulation may be necessary in 
#   order to generate the vector of individual probabilities. 
#   This is done using the p.vec.func() function and requires 
#   the user to set a seed in order to reproduce results.
# This example takes less than 1 second to run.
# Estimated running time was calculated using a 
#   computer with 16 GB of RAM and one core of an 
#   Intel i7-6500U processor.
set.seed(8791)
p.vec2 <- p.vec.func(p=0.02, alpha=0.5, grp.sz=25)
Informative.array.prob(prob.vec=p.vec2, nr=5, nc=5, method="sd")



