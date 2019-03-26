library(mcga)


### Name: OnePointCrossOverOnDoublesUsingBytes
### Title: One-point Crossover operation on the two vectors of doubles
###   using their byte representations
### Aliases: OnePointCrossOverOnDoublesUsingBytes

### ** Examples

d1 <- runif(3)
d2 <- runif(3)
cutp <- sample(1:(length(d1)*SizeOfDouble()), 1)[1]
offspring <- OnePointCrossOverOnDoublesUsingBytes(d1,d2, cutp)
print("Parents:")
print(d1)
print(d2)
print("Offspring:")
print(offspring[[1]])
print(offspring[[2]])



