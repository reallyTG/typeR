library(magic)


### Name: circulant
### Title: Circulant matrices of any order
### Aliases: circulant is.circulant
### Keywords: array

### ** Examples

circulant(5)
circulant(2^(0:4))
is.circulant(circulant(5))

 a <- outer(1:3,1:3,"+")%%3
 is.circulant(a)
 is.circulant(a,c(1,2))

 is.circulant(array(c(1:4,4:1),rep(2,3)))

 is.circulant(magic(5)%%5,c(1,-2))




