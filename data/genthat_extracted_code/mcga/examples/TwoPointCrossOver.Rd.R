library(mcga)


### Name: TwoPointCrossOver
### Title: Two Point Crossover operation on the two vectors of bytes
### Aliases: TwoPointCrossOver

### ** Examples

b1 <- DoubleVectorToBytes(c(56.54, 89.7666, 98.565))
b2 <- DoubleVectorToBytes(c(79.76, 56.4443, 34.22121))
cutpoints <- sort(sample(1:(length(b1)*SizeOfDouble()), 2, replace = FALSE))
result <- TwoPointCrossOver(b1,b2, cutpoints[1], cutpoints[2])
print(ByteVectorToDoubles(result[[1]]))
print(ByteVectorToDoubles(result[[2]]))



