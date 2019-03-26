library(triangle)


### Name: triangle
### Title: The Triangle Distribution
### Aliases: triangle dtriangle ptriangle qtriangle rtriangle
### Keywords: distribution

### ** Examples

## view the distribution
tri <- rtriangle(100000, 1, 5, 3)
hist(tri, breaks=100, main="Triangle Distribution", xlab="x")

mean(tri) # 1/3*(1 + 5 + 3) = 3
var(tri)  # 1/18*(1^2 + 3^2 + 5^2 - 1*5 - 1*3 - 5*3) = 0.666667

dtriangle(0.5, 0, 1, 0.5) # 2/(b-a) = 2

qtriangle(ptriangle(0.7)) # 0.7



