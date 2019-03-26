library(rockchalk)


### Name: removeNULL
### Title: Remove NULL values variables from a list
### Aliases: removeNULL

### ** Examples

## Note it is non-recursive, NULL remains in e
x <- list(a = rnorm(5), b = NULL, c = rnorm(5), d = NULL,
     e = list(f = rnorm(2), g = NULL))
x
removeNULL(x)



