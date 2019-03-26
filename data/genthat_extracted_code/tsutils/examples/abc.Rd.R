library(tsutils)


### Name: abc
### Title: ABC analysis
### Aliases: abc plot.abc
### Keywords: ts

### ** Examples

x <- abs(matrix(cumsum(rnorm(5400,0,1)),36,150))
z <- abc(x)
print(z)
plot(z)




