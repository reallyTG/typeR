library(mcga)


### Name: UniformCrossOverOnDoublesUsingBytes
### Title: Uniform Crossover operation on the two vectors of doubles using
###   their byte representations
### Aliases: UniformCrossOverOnDoublesUsingBytes

### ** Examples

d1 <- runif(3)
d2 <- runif(3)
offspring <- UniformCrossOverOnDoublesUsingBytes(d1,d2)
print("Parents:")
print(d1)
print(d2)
print("Offspring:")
print(offspring[[1]])
print(offspring[[2]])



