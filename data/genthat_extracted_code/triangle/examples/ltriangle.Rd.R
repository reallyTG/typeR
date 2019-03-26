library(triangle)


### Name: ltriangle
### Title: The Logarithmic Triangle Distribution
### Aliases: ltriangle dltriangle pltriangle qltriangle rltriangle
### Keywords: distribution

### ** Examples

## view the distribution
tri <- rltriangle(100000, 1, 100, 10)
hist(log10(tri), breaks=100, main="Triangle Distribution", xlab="x")

dltriangle(10, 1, 100, 10) # 2/(log10(b)-log10(a)) = 1

qltriangle(pltriangle(10)) # 10



