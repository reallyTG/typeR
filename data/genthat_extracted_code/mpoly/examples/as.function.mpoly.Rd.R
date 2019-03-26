library(mpoly)


### Name: as.function.mpoly
### Title: Change a multivariate polynomial into a function.
### Aliases: as.function.mpoly

### ** Examples


p <- mp("x + 3 x y + z^2 x")
f <- as.function(p)
f(1:3) # -> 16
f(c(1,1,1)) # -> 5

f <- as.function(p, vector = FALSE)
f(1, 2, 3) # -> 16
f(1, 1, 1) # -> 5

f <- as.function(p, varorder = c("z","y","x"), vector = FALSE)
f(3, 2, 1) # -> 16
f(1, 1, 1) # -> 5

# for univariate mpolys, as.function() returns a vectorized function
# that can even apply to arrays
p <- mp("x^2")
f <- as.function(p)
f(1:10)
(mat <- matrix(1:4, 2))
f(mat)


p <- mp("1 2 3 4")
f <- as.function(p)
f(10) # -> 24







