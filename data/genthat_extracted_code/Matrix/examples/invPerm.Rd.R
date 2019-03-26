library(Matrix)


### Name: invPerm
### Title: Inverse Permutation Vector
### Aliases: invPerm
### Keywords: arithmetic

### ** Examples

  p <- sample(10) # a random permutation vector
  ip <- invPerm(p)
  p[ip] # == 1:10
  ## they are indeed inverse of each other:
  stopifnot(
    identical(p[ip], 1:10),
    identical(ip[p], 1:10),
    identical(invPerm(ip), p)
  )
## Don't show: 
 p3 <- c(3, 1:2) # ('double' instead of integer)
 stopifnot(identical(invPerm(p3), c(2:3, 1L)))
## End(Don't show)



