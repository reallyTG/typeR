library(mcga)


### Name: UniformCrossOver
### Title: Uniform Crossover operation on the two vectors of bytes
### Aliases: UniformCrossOver

### ** Examples

b1 <- DoubleVectorToBytes(c(56.54, 89.7666, 98.565))
b2 <- DoubleVectorToBytes(c(79.76, 56.4443, 34.22121))
result <- UniformCrossOver(b1,b2)
print(ByteVectorToDoubles(result[[1]]))
print(ByteVectorToDoubles(result[[2]]))



