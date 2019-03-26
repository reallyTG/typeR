library(mcga)


### Name: OnePointCrossOver
### Title: One Point Crossover operation on the two vectors of bytes
### Aliases: OnePointCrossOver

### ** Examples

b1 <- DoubleVectorToBytes(c(56.54, 89.7666, 98.565))
b2 <- DoubleVectorToBytes(c(79.76, 56.4443, 34.22121))
result <- OnePointCrossOver(b1,b2, round(runif(1,1,SizeOfDouble() * 3)))
print(ByteVectorToDoubles(result[[1]]))
print(ByteVectorToDoubles(result[[2]]))



