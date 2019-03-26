library(permutations)


### Name: orbit
### Title: Orbits of integers
### Aliases: orbit orbit_single
### Keywords: symbolmath

### ** Examples

data(megaminx)
orbit(megaminx,13)


# orbit() is vectorized:
x <- cycle(list(list(a=1:2,4:6,8:10)))
orbit(x,1:10)




