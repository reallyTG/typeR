library(matsbyname)


### Name: replaceNaN_byname
### Title: Replace NaN values with a value
### Aliases: replaceNaN_byname

### ** Examples

suppressWarnings(a <- matrix(c(1, sqrt(-1))))
replaceNaN_byname(a)
replaceNaN_byname(a, 42)



