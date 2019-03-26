library(tsutils)


### Name: xyz
### Title: XYZ analysis
### Aliases: xyz
### Keywords: ts

### ** Examples

x <- abs(matrix(cumsum(rnorm(5400,0,1)),36,150))
z <- xyz(x,m=12)
print(z)
plot(z)




