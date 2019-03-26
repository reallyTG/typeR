library(gapfill)


### Name: ArrayAround
### Title: Subset an Array with 4 dimensions
### Aliases: ArrayAround ArrayAroundRandom

### ** Examples

a <- array(1:16, c(2, 2, 2, 2))
ArrayAround(data = a, mp = c(1, 1, 1, 1), size = c(0, 0, 0, 0))
## returns the first element a[1,1,1,1]

ArrayAround(data = a, mp = c(2, 2, 2, 2), size = c(0, 0, 0, 0))
## returns the last element a[2,2,2,2]

ArrayAround(data = a, mp = c(1, 1, 1, 1), size = c(1, 0, 0, 0))
## returns a[1:2,1,1,1]

ArrayAround(data = a, mp = c(1, 1, 1, 1), size = c(1, 1, 1, 1))
## returns a


ArrayAroundRandom(a)
ArrayAroundRandom(a, size = c(1, 2, 1, 2))



