library(mcga)


### Name: TwoPointCrossOverOnDoublesUsingBytes
### Title: Two-point Crossover operation on the two vectors of doubles
###   using their byte representations
### Aliases: TwoPointCrossOverOnDoublesUsingBytes

### ** Examples

d1 <- runif(3)
d2 <- runif(3)
cutpoints <- sort(sample(1:(length(d1)*SizeOfDouble()), 2, replace = FALSE))
offspring <- TwoPointCrossOverOnDoublesUsingBytes(d1,d2,cutpoints[1], cutpoints[2])
print("Parents:")
print(d1)
print(d2)
print("Offspring:")
print(offspring[[1]])
print(offspring[[2]])



