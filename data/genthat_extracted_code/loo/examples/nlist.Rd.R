library(loo)


### Name: nlist
### Title: Named lists
### Aliases: nlist
### Keywords: internal

### ** Examples


# All variables already defined
a <- rnorm(100)
b <- mat.or.vec(10, 3)
nlist(a,b)

# Define some variables in the call and take the rest from the environment
nlist(a, b, veggies = c("lettuce", "spinach"), fruits = c("banana", "papaya"))




